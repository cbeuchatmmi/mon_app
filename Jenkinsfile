pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Clone le dépôt GitHub avec credentials
                git credentialsId: 'votre-credential-id', url: 'https://github.com/cbeuchatmmi/mon_app'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Construire l'image Docker
                script {
                    docker.build('mon_app:latest')
                }
            }
        }
        stage('Run Tests') {
            steps {
                // Exemple de tests (vous pouvez personnaliser cette étape)
                sh 'echo "No tests defined"'
            }
        }
        stage('Deploy') {
            steps {
                // Déployer ou exécuter le conteneur Docker
                sh 'docker run -d -p 3000:3000 mon_app:latest'
            }
        }
    }
}