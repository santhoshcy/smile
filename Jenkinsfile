pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/santhoshcy/smile.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t smile-website .'
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: '']) {
                    sh 'docker tag smile-website santhoshcy/smile-website:latest'
                    sh 'docker push santhoshcy/smile-website:latest'
                }
            }
        }
        stage('Deploy to EC2') {
            steps {
                sh 'ssh -i smile-key.pem ubuntu@<EC2-IP> "docker run -d -p 80:80 santhoshcy/smile-website:latest"'
            }
        }
    }
}
