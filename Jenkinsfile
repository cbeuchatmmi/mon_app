pipeline {
    agent any

    environment {
        IMAGE_NAME = "mon-app-image"
        CONTAINER_NAME = "mon-app-container"
    }

    stages {
        stage('Cloner le dépôt Git') {
            steps {
                echo "🚀 Clonage du dépôt Git..."
                git url: ' https://github.com/cbeuchatmmi/mon_app.git', branch: 'main'
            }
        }

        stage('Installer les dépendances et exécuter les tests') {
            steps {
                echo "Installation des dépendances et tests unitaires..."
                sh 'npm install'
                sh 'npm test'
            }
        }

        stage('Construire l\'image Docker') {
            steps {
                script {
                    echo "Construction de l'image Docker..."
                    sh 'docker build -t ${IMAGE_NAME} .'
                }
            }
        }

        stage('Déployer sur le serveur de test') {
            steps {
                script {
                    echo "Déploiement de l'application sur le serveur de test..."
                    sh 'docker stop ${CONTAINER_NAME} || true'
                    sh 'docker rm ${CONTAINER_NAME} || true'
                    sh 'docker run -d --name ${CONTAINER_NAME} -p 3000:3000 ${IMAGE_NAME}'
                }
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline exécuté avec succès !"
        }
        failure {
            echo "❌ Échec du pipeline"
        }
    }
}
