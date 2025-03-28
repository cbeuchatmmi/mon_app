pipeline {
    agent any
    stages {
        stage('Install Node.js and npm') {
            steps {
                script {
                    sh 'apt-get update && apt-get install -y nodejs npm'
                }
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
    }
}
