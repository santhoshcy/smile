pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = 'dockerhub'  // Replace with the Jenkins credentials ID for Docker Hub
    }

    stages {
        stage('Docker Hub Validation') {
            steps {
                script {
                    try {
                        // Get Docker Hub credentials from Jenkins credentials store
                        withCredentials([usernamePassword(credentialsId: DOCKER_HUB_CREDENTIALS, usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
                            
                            // Debugging output to check the credentials being used
                            echo "Using Docker Hub username: ${DOCKER_HUB_USERNAME}"

                            // Attempt Docker login
                            def loginCommand = "echo ${DOCKER_HUB_PASSWORD} | docker login -u ${DOCKER_HUB_USERNAME} --password-stdin"
                            def loginResult = sh(script: loginCommand, returnStatus: true)

                            if (loginResult == 0) {
                                echo "Docker Hub credentials validated successfully."
                            } else {
                                error "Docker Hub login failed. Check credentials."
                            }
                        }
                    } catch (Exception e) {
                        error "An error occurred while validating Docker Hub credentials: ${e.getMessage()}"
                    }
                }
            }
        }
    }
}
