pipeline {
    agent any

    environment {
        IMAGE_NAME = "manesankett/ci-cd-mini-project"
    }

    stages {
        stage('Checkout') {
            steps {
                 git 'https://github.com/Sanketmane5511/ci-cd-mini-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:latest .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh '''
                    echo Pass@1234 | docker login -u manesankett@gmail.com --password-stdin
                    docker push $IMAGE_NAME:latest
                '''
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                sh '''
                    docker-compose down || true
                    docker-compose up -d
                '''
            }
        }
    }
}
