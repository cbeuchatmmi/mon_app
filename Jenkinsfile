pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "mon_app"
        DOCKER_REGISTRY = "dockerhub"
    }

    stages {
        stage('Cloner le dépôt Git') {
            steps {
                git 'https://github.com/cbeuchatmmi/mon_app.git'
            }
        }

        stage('Installer les dépendances et exécuter les tests') {
            steps {
                script {
                    // Installer les dépendances et exécuter les tests
                    sh 'npm install'
                    sh 'npm test'
                }
            }
        }

        stage('Construire l\'image Docker') {
            steps {
                script {
                    // Construire l'image Docker
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                }
            }
        }

        stage('Déployer sur le serveur de test') {
            steps {
                script {
                    // Déployer l'application sur un serveur de test
                    // (par exemple avec Docker)
                    sh 'docker run -d -p 8080:8080 ${DOCKER_IMAGE}'
                }
            }
        }
    }

    post {
        always {
            // Actions à exécuter après le pipeline
            cleanWs()  // Nettoyer l'espace de travail
        }
    }
}
