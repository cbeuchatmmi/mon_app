pipeline {
    agent any
    stages {
        stage('Cloner le dépôt Git') {
            steps {
                git branch: 'main', url: 'https://github.com/cbeuchatmmi/mon_app.git'
            }
        }

        stage('Installer les dépendances et exécuter les tests') {
            steps {
                sh 'npm install'
                sh 'npm test'
            }
        }

        stage('Construire l\'image Docker') {
            steps {
                sh 'docker build -t mon_app .'
            }
        }

        stage('Déployer sur le serveur de test') {
            steps {
                sh 'docker run -d -p 3000:3000 mon_app'
            }
        }
    }
}
