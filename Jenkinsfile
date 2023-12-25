pipeline {
    agent any

    tools {
        nodejs "nodejs"
    }

    stages {
        stage('Install Packages') {
            // when {
            //     branch "main"
            // }
            steps {
                echo env.BRANCH_NAME
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