pipeline {
    agent any  // L'agent définit où le pipeline va s'exécuter. "any" signifie que le pipeline peut s'exécuter sur n'importe quel nœud disponible

    environment {
        DOCKER_IMAGE = "mon_app"  // Nom de l'image Docker
        DOCKER_REGISTRY = "dockerhub"  // (Si applicable) Le registre Docker
    }

    stages {
        // 1. Cloner le dépôt Git
        stage('Cloner le dépôt Git') {
            steps {
                git 'https://github.com/cbeuchatmmi/mon_app.git'  // Cloner le dépôt à partir de GitHub
            }
        }

        // 2. Installer les dépendances et exécuter les tests
        stage('Installer les dépendances et exécuter les tests') {
            steps {
                script {
                    // Installer les dépendances Node.js avec npm
                    sh 'npm install'
                    // Exécuter les tests unitaires
                    sh 'npm test'
                }
            }
        }

        // 3. Construire l'image Docker
        stage('Construire l\'image Docker') {
            steps {
                script {
                    // Construire l'image Docker avec le tag mon_app
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                }
            }
        }

        // 4. Déployer sur le serveur de test
        stage('Déployer sur le serveur de test') {
            steps {
                script {
                    // Déployer l'image Docker sur le serveur de test
                    // Ici, on exécute le conteneur Docker avec le port 8080 exposé
                    sh 'docker run -d -p 8080:8080 ${DOCKER_IMAGE}'
                }
            }
        }
    }

    post {
        always {
            // Action à exécuter après le pipeline, quel que soit son succès ou échec
            cleanWs()  // Nettoyer l'espace de travail
        }
    }
}
