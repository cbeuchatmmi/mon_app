pipeline {
    agent any
    tools {
        nodejs 'nodejs-16' // Prénom configuré dans Global Tool Configuration
    }
    stages {
        stage('Install dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Run tests') {
            steps {
                sh 'npm test'
            }
        }
    }
}
