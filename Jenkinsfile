pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                // Cloner la branche main du dépôt public
                git url: 'https://github.com/cbeuchatmmi/mon_app.git', branch: 'main'
            }
        }
        stage('Install Dependencies') {
            steps {
                script {
                    // Forcer l'installation des dépendances en contournant l'environnement géré par le système
                    sh 'pip install --break-system-packages -r requirements.txt'
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    // Exécuter les tests
                    sh 'python -m unittest discover -s tests'
                }
            }
        }
    }
}
