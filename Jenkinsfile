pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/cbeuchatmmi/mon_app.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                script {
                    // Créer un environnement virtuel
                    sh 'python3 -m venv venv'
                    // Activer l'environnement virtuel et installer les dépendances
                    sh '. venv/bin/activate && pip install -r requirements.txt'
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    // Exécuter les tests
                    sh '. venv/bin/activate && python -m unittest discover -s tests'
                }
            }
        }
    }
}
