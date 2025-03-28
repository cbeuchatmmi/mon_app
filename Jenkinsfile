pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Install dependencies') {
            steps {
                script {
                    sh 'npm install'
                }
            }
        }
        stage('Run tests') {
            steps {
                script {
                    sh 'npm test'
                }
            }
        }
        stage('Build Docker image') {
            steps {
                script {
                    sh 'docker build -t mon_app .'
                }
            }
        }
    }
}
