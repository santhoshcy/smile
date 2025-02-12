pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/santhoshcy/smile.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the application...'
                // Add build commands here, if needed
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying to EC2...'
                // Add deployment steps here
            }
        }
    }
}

