pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the Smile website repository from GitHub
                git 'https://github.com/santhoshcy/smile.git'
            }
        }

        stage('List Files') {
            steps {
                script {
                    // List files in the workspace to confirm Dockerfile presence
                    sh 'ls -l smile'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Navigate to the correct directory where Dockerfile exists
                    dir('smile') {
                        // Build the Docker image
                        docker.build('smile-website')
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container from the built image
                    docker.image('smile-website').run('-d -p 80:80 --name smile-container')
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
