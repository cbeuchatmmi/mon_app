pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'ton_dockerhub_username/ton_image'  // Remplace par ton nom d'utilisateur Docker Hub et le nom de ton image
        DOCKER_HUB_CREDENTIALS = 'docker_hub_credentials' // Remplace par le nom de tes identifiants Docker Hub dans Jenkins
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/cbeuchatmmi/mon_app.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Construire l'image Docker
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Se connecter à Docker Hub et pousser l'image
                    withCredentials([usernamePassword(credentialsId: DOCKER_HUB_CREDENTIALS, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh """
                        echo ${DOCKER_PASSWORD} | docker login --username ${DOCKER_USERNAME} --password-stdin
                        docker push ${DOCKER_IMAGE}
                        """
                    }
                }
            }
        }
    }
}
