pipeline {
    agent any

    environment {
        IMAGE_NAME = "mon_app_image"
        DOCKER_TAG = "latest"
        SSH_SERVER = "user@test-server"
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
                    // Ajouter le contexte de build avec le plugin Docker
                    docker.build("${IMAGE_NAME}:${DOCKER_TAG}", "--no-cache .")
                }
            }
        }

        stage('Deploy to Test Server') {
            steps {
                sshagent(['ssh-test-server']) {  // Utiliser les credentials SSH
                    script {
                        sh """
                            ssh -o StrictHostKeyChecking=no ${SSH_SERVER} "
                                docker stop mon_app_container || true
                                docker rm mon_app_container || true
                                docker pull ${IMAGE_NAME}:${DOCKER_TAG}
                                docker run -d -p 80:5000 --name mon_app_container ${IMAGE_NAME}:${DOCKER_TAG}
                            "
                        """
                    }
                }
            }
        }
    }
}

