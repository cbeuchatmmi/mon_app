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
                    // Créer un environnement virtuel
                    sh 'python3 -m venv venv'
                    // Activer l'environnement virtuel et installer les dépendances
                    sh ''' 
                    source venv/bin/activate
                    pip install -r requirements.txt
                    '''
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    // Exécuter les tests
                    sh ''' 
                    source venv/bin/activate
                    python -m unittest discover -s tests
                    '''
                }
            }
        }
    }
}
