pipeline {
    agent any

    stages {
        stage('Build Docker image') {
            steps {
                sh 'docker-compose build'
            }
        }
        stage('Run tests') {
            steps {
                echo 'No tests yet, coming soon!'
            }
        }
    }
}
