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
                // Installer les dépendances Python
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Run Tests') {
            steps {
                // Lancer les tests
                sh 'python -m unittest discover -s tests'
            }
        }
    }
}
