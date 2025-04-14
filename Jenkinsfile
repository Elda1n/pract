pipeline {
    agent any

    environment {
        COMPOSE_FILE = 'docker-compose.yml'
    }

    stages {
        stage('Clone repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Elda1n/pract'
            }
        }

        stage('Build containers') {
            steps {
                sh 'docker compose build'
            }
        }

        stage('Start containers') {
            steps {
                sh 'docker compose up -d'
            }
        }

        stage('Wait for web') {
            steps {
                script {
                    def retries = 10
                    def delay = 3
                    def success = false

                    for (int i = 0; i < retries; i++) {
                        def result = sh(script: "curl -s -o /dev/null -w '%{http_code}' http://localhost:5000", returnStdout: true).trim()
                        if (result == '200') {
                            success = true
                            break
                        }
                        sleep time: delay, unit: 'SECONDS'
                    }

                    if (!success) {
                        error("Flask app is not responding on port 5000")
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Stopping containers...'
            sh 'docker compose down'
        }
    }
}
