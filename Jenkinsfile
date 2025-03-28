pipeline {
    agent any

    environment {
        // Définir le nom de l'image Docker que tu souhaites construire
        IMAGE_NAME = "mon_app_image"
        DOCKER_TAG = "latest"
        SERVER_TEST = "user@your-test-server:/path/to/deployment/directory"
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Cloner la branche main du dépôt public
                git url: 'https://github.com/cbeuchatmmi/mon_app.git', branch: 'main'
            }
        }
        stage('Check Python Version') {
            steps {
                script {
                    // Vérifier que python3 et pip3 sont disponibles dans le PATH
                    sh 'python3 --version'
                    sh 'pip3 --version'
                }
            }
        }
        stage('Install Dependencies') {
            steps {
                script {
                    // Installer les dépendances dans l'environnement global
                    sh 'pip3 install --break-system-packages -r requirements.txt'
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    // Exécuter les tests avec python3
                    sh 'python3 -m unittest discover -s tests'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Construire l'image Docker à partir du Dockerfile
                    sh 'docker build -t ${IMAGE_NAME}:${DOCKER_TAG} .'
                }
            }
        }
        stage('Deploy to Test Server') {
            steps {
                script {
                    // Déployer l'image Docker sur un serveur de test
                    // Ce déploiement dépend du type de déploiement que tu veux faire (par ex. docker run ou docker-compose)
                    
                    // Connecter le serveur via SSH et exécuter la commande de déploiement
                    sh """
                    ssh ${SERVER_TEST} 'docker pull ${IMAGE_NAME}:${DOCKER_TAG}'
                    ssh ${SERVER_TEST} 'docker run -d --name mon_app_container ${IMAGE_NAME}:${DOCKER_TAG}'
                    """
                }
            }
        }
    }
}
