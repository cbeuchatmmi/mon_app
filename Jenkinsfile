pipeline {
    agent {
        docker {
            image 'python:3.9'  // Utilisation d'une image Docker avec Python préinstallé
        }
    }
    stages {
        stage('Clone Repository') {
            steps {
                git credentialsId: 'github-credentials', url: 'https://github.com/cbeuchatmmi/mon_app.git'
            }
        }
        stage('Verify Python') {
            steps {
                sh 'python --version'
                sh 'pip --version'
            }
        }
        stage('List Files') {
            steps {
                sh 'ls -l'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'python -m unittest discover -s tests'
            }
        }
    }
}
