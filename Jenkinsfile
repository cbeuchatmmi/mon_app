pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
        DOCKER_IMAGE = "votreuser/mon-app:${env.BUILD_ID}"
        SSH_SERVER = "user@test-server"
    }

    stages {
        // Étape 1 : Clone du dépôt
        stage('Checkout') {
            steps {
                git url: 'https://github.com/cbeuchatmmi/mon_app.git', 
                     branch: 'main'
            }
        }

        // Étape 2 : Exécution des tests
        stage('Tests') {
            steps {
                sh '''
                    python3 -m venv .venv
                    . .venv/bin/activate
                    pip install -r requirements.txt
                    pytest tests/ --junitxml=test-results.xml
                '''
            }
            post {
                always {
                    junit 'test-results.xml'  // Publication des résultats
                }
            }
        }

        // Étape 3 : Build Docker
        stage('Build Docker') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        // Étape 4 : Déploiement
        stage('Deploy') {
            steps {
                sshagent(['ssh-test-server']) {
                    sh """
                        ssh ${SSH_SERVER} "docker stop mon-app || true"
                        ssh ${SSH_SERVER} "docker rm mon-app || true"
                        ssh ${SSH_SERVER} "docker pull ${DOCKER_IMAGE}"
                        ssh ${SSH_SERVER} "docker run -d --name mon-app -p 80:5000 ${DOCKER_IMAGE}"
                    """
                }
            }
        }
    }
}