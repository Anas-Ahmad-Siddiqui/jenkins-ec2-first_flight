pipeline {
    agent any

    tools {
        nodejs "nodejs"
    }

    stages {
        stage('Install Packages') {
            steps {
                script {
                    sh 'npm install'
                }
            }
        }

        stage('Run the App') {
            steps {
                script {
                    sh 'pm2 start server.js --name=expressjs-app'
                    sh 'pm2 save'
                    sh 'pm2 startup'
                    sh 'pm2 restart expressjs-app'
                    sleep 5
                }
            }
        }

        stage('Visit /items route') {
            steps {
                script {
                    sh 'curl http://localhost:3000/items'
                }
            }
        }

        // stage('Cleanup') {
        //     steps {
        //         script {
        //             sh 'pkill -f "node"'
        //         }
        //     }
        // }
    }
}