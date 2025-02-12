pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the Smile website repository from GitHub
                git 'https://github.com/santhoshcy/smile.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build('smile-website')
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container from the image
                    docker.run('smile-website', '-d -p 80:80 --name smile-container')
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                script {
                    // Verify if the website is running
                    sh 'curl -f http://localhost:80 || exit 1'
                }
            }
        }
    }
}
