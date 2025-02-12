pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository from GitHub
                git 'https://github.com/santhoshcy/smile.git'
            }
        }

        stage('Confirm Build') {
            steps {
                // Just echoing a message to confirm the build
                echo 'Build Confirmed!'
            }
        }
    }
}
