pipeline {
    agent any

    tools {
        nodejs "nodejs"
    }

    stages {
        stage('SSH') {
            steps {
                script{
                    def remote = [:]
                    remote.name = 'your-remote-host-name'  // Replace with your remote host name
                    remote.host = '13.126.27.177'  // Replace with remote host IP or hostname
                    remote.user = 'EC2-USER'   // Replace with remote username
                    remote.credentialsId = '13.126.27.177' 

                    sshCommand remote: remote, command: 'ls -lrt'
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