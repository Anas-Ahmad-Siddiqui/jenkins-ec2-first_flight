pipeline {
    agent any

    tools {
        nodejs "nodejs"
    }

    stages {
         stage('Copying Application Files') {
            steps {
                script {
                    echo "Copying Application Files"
                    // Configure SSH credentials (replace with your credentials)
                    sshagent (credentials: ['13.234.238.178']) {
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@13.233.114.148 'hostname;'"
                        sh "scp deploy.sh ec2-user@13.233.114.148:/home/ec2-user/"
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@13.233.114.148 'bash /home/ec2-user/deploy.sh'"
                    }
                }
            }
        }

        stage('Install Dependencies') {

            steps {
                script {
                    sshagent (credentials: ['13.234.238.178']) {
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@13.233.114.148 'bash /home/ec2-user/jenkins-ec2-first_flight/scripts/before_install.sh'"
                    }
                }
            }
        }

        stage('Install Application Packages') {
            steps {
                script {
                    sshagent (credentials: ['13.234.238.178']) {
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@13.233.114.148 'bash /home/ec2-user/jenkins-ec2-first_flight/scripts/after_install.sh'"
                    }
                }
            }
        }

        stage('Starting the Application') {
            steps {
                script {
                    sshagent (credentials: ['13.234.238.178']) {
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@13.233.114.148 'bash /home/ec2-user/jenkins-ec2-first_flight/scripts/application_start.sh'"
                    }
                }
            }
        }

        stage('Verifying Application Health') {
            steps {
                script {
                    fetch("http://13.233.114.148/items")
                        .then(response => {
                            // Check if the request was successful (status code 200-299)
                            if (!response.ok) {
                            throw new Error(`HTTP error! Status: ${response.status}`);
                            }
                            
                            // Parse the response JSON
                            return response.json();
                        })
                        .then(data => {
                            // Log the received JSON to the console
                            console.log('Received JSON:', data);
                        })
                        .catch(error => {
                            // Log any errors that occurred during the fetch
                            console.error('Fetch error:', error);
                        });
                }
            }
        }
    }
    // post {
    //     always {
    //         // 
    //     }
    //     success {
    //         // 
    //     }
    //     failure {
    //         // 
    //     }
    // }
}