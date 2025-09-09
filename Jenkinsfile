pipeline {
    agent any

    environment {
        IMAGE_NAME = "manesankett/ci-cd-mini-project"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Sanketmane5511/ci-cd-mini-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %IMAGE_NAME%:latest .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                bat '''
                    echo Pass@1234 | docker login -u manesankett@gmail.com --password-stdin
                    docker push %IMAGE_NAME%:latest
                '''
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                bat '''
                    docker-compose down || exit 0
                    docker-compose up -d
                '''
            }
        }
    }
}
