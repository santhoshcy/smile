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
                        def dockerHubCredentials = credentials(DOCKER_HUB_CREDENTIALS)
                        def dockerHubUsername = dockerHubCredentials.username
                        def dockerHubPassword = dockerHubCredentials.password

                        // Attempt Docker login
                        def loginCommand = "echo ${dockerHubPassword} | docker login -u ${dockerHubUsername} --password-stdin"
                        def loginResult = sh(script: loginCommand, returnStatus: true)

                        if (loginResult == 0) {
                            echo "Docker Hub credentials validated successfully."
                        } else {
                            error "Docker Hub login failed. Check credentials."
                        }
                    } catch (Exception e) {
                        error "An error occurred while validating Docker Hub credentials: ${e.getMessage()}"
                    }
                }
            }
        }
    }
}
