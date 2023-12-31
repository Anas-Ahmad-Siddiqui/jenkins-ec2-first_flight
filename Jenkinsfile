pipeline {
    agent any

    environment {
        CREDENTIALS_ID = '13.234.238.178'
        TARGET_HOST = '13.233.114.148'
    }

    tools {
        nodejs "nodejs"
    }

    stages {
        stage('Copying Application Files') {
            steps {
                script {
                    echo "Copying Application Files"
                    // Configure SSH credentials (replace with your credentials)
                    sshagent (credentials: [CREDENTIALS_ID]) {
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@${TARGET_HOST} 'hostname;'"
                        sh "scp deploy.sh ec2-user@${TARGET_HOST}:/home/ec2-user/"
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@${TARGET_HOST} 'bash /home/ec2-user/deploy.sh'"
                    }
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    sshagent (credentials: [CREDENTIALS_ID]) {
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@${TARGET_HOST} 'bash /home/ec2-user/jenkins-ec2-first_flight/scripts/before_install.sh'"
                    }
                }
            }
        }

        stage('Install Application Packages') {
            steps {
                script {
                    sshagent (credentials: [CREDENTIALS_ID]) {
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@${TARGET_HOST} 'bash /home/ec2-user/jenkins-ec2-first_flight/scripts/after_install.sh'"
                    }
                }
            }
        }

        stage('Starting the Application') {
            steps {
                script {
                    sshagent (credentials: [CREDENTIALS_ID]) {
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@${TARGET_HOST} 'bash /home/ec2-user/jenkins-ec2-first_flight/scripts/application_start.sh'"
                    }
                }
            }
        }

        stage('Verifying Application Health') {
            steps {
                script {
                    def apiUrl = "http://${TARGET_HOST}:3000/items"
                    // Make a GET request using the sh step to run shell commands
                    def result = sh(script: "curl -s $apiUrl", returnStatus: true)
                    
                    // Check if the curl command was successful (exit code 0)
                    if (result == 0) {
                        // Parse the JSON response
                        def jsonResponse = sh(script: "curl -s $apiUrl", returnStdout: true).trim()
                        echo "Received JSON: ${jsonResponse}"
                    } else {
                        error "Failed to make the GET request. Exit code: ${result}"
                    }
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
