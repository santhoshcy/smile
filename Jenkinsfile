pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "santhoshcy/smile"  // Change to your Docker Hub repo
        DOCKER_CREDENTIALS_ID = "dockerhub"  // The ID we added in Jenkins
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/santhoshcy/smile'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $DOCKER_IMAGE ."
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                    }
                }
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                script {
                    sh "docker push $DOCKER_IMAGE"
                }
            }
        }

        stage('Clean Up') {
            steps {
                sh "docker rmi $DOCKER_IMAGE"
            }
        }
    }
}
