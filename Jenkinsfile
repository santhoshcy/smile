pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "santhoshcy/smile"  // Your Docker Hub repo
        DOCKER_CREDENTIALS_ID = "dockerhub"  // Docker Hub credentials in Jenkins
        GIT_REPO = "https://github.com/santhoshcy/smile.git"
        WORKDIR = "smile"  // Name of the cloned directory
    }

    stages {
        stage('Checkout Code') {
            steps {
                script {
                    sh "rm -rf $WORKDIR"  // Clean previous builds
                    sh "git clone $GIT_REPO"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "cd $WORKDIR && docker build -t $DOCKER_IMAGE ."
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
