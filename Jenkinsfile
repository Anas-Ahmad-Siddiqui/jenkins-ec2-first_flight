pipeline {
    agent any

    tools {
        nodejs "nodejs"
    }

    stages {
         stage('Execute commands on remote host') {
            steps {
                script {
                    echo "Exec"
                    // Configure SSH credentials (replace with your credentials)
                    sshagent (credentials: ['13.234.238.178']) {
                        sh "ls"
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@43.205.96.230 'hostname;'"
                        sh "scp deploy.sh ec2-user@43.205.96.230:/home/ec2-user/"
                        // sh "ssh -o StrictHostKeyChecking=no ec2-user@43.205.96.230 'bash /home/ec2-user/deploy.sh'"
                        
                    }
                }
            }
        }

        stage('Install Packages') {

            steps {
                echo env.GIT_BRANCH
                echo env.NODE_NAME
            }
        }

        stage('Run the App') {
            steps {
                echo "running ..."
            }
        }

        stage('Visit /items route') {
            steps {
                echo "Visiting ..."
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