pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                script {
                    sh 'rm -rf smile || true'  // Clean previous repo if exists
                    sh 'git clone https://github.com/santhoshcy/smile.git'
                    sh 'ls -la smile/'  // Verify contents after cloning
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'cd smile && docker build -t santhoshcy/smile .'
                }
            }
        }
    }
}
