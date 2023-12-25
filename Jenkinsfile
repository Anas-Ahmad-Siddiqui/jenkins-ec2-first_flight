pipeline {
    agent any

    tools {
        nodejs "nodejs"
    }

    stages {
         stage('Execute commands on remote host') {
            steps {
                script {
                    // Configure SSH credentials (replace with your credentials)
                    sshagent (credentials: ['13.126.27.177']) {
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@13.232.3.79"
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