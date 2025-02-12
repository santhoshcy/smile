pipeline {
    agent any

    environment {
        // Define Docker image name
        IMAGE_NAME = 'smile-website'
        DOCKER_REGISTRY = 'docker.io'
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the GitHub repository
                git clone 'https://github.com/santhoshcy/smile.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image from the static website
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Run Tests (Optional)') {
            steps {
                script {
                    // Run basic static analysis or tests (if any)
                    echo "Running tests or static code analysis..."
                    // Placeholder for tests if needed
                }
            }
        }

        stage('Push Docker Image to Registry') {
            steps {
                script {
                    // Login to Docker registry (optional for public repositories)
                    docker.withRegistry('', 'docker-hub-credentials') {
                        docker.image("${IMAGE_NAME}").push()
                    }
                }
            }
        }

        stage('Deploy to Server') {
            steps {
                script {
                    // Deploy the website to the target server
                    // Assuming you're using a Docker container to host the website
                    sh '''
                        docker pull ${DOCKER_REGISTRY}/${IMAGE_NAME}
                        docker run -d -p 80:80 --name smile-website ${DOCKER_REGISTRY}/${IMAGE_NAME}
                    '''
                }
            }
        }

        stage('Post-Deployment Verification') {
            steps {
                script {
                    // Verify that the website is running correctly
                    echo "Verifying the deployment..."
                    // Placeholder for any HTTP health check or verification
                }
            }
        }
    }

    post {
        always {
            // Cleanup if any Docker containers were left
            sh 'docker ps -a | grep "smile-website" | awk "{print \$1}" | xargs docker rm -f'
        }
    }
}
