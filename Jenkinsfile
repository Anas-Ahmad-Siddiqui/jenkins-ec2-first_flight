pipeline {
    agent any

    tools {
        nodejs "nodejs"
    }

    stages {
        stage('Install Packages') {
            when {
                expression {
                    BRANCH_MAIN == 'dev'
                }
            }
            steps {
                echo "Installing ..."
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