pipeline {
    agent any
    stages {
        stage('Checkout'){
            steps {
                checkout scm //pull the code from wherever repo this jenkins file came from
            }
        }
        stage ('Install Dependencies'){
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage ('test'){
            steps {
                sh 'pytest test_app.py -v' #--verbose to see a detailed output (test by test)
            }
        }
        stage ('Lint'){
            steps{
                sh 'flake8 app.py --max-line-length=88'
                //Reads the code without executing it and checks against set of style and error rules define in 'PEP8'
                //'PEP8' is Python's official style guide
            }
        }
        //test catches broke code
        //Lint catches bad code
    }
    post {
        success {
            echo 'Pipeline ran successfully'
        }
        failure {
            echo 'Pipeline failed. Check the log'
        }
    }
}