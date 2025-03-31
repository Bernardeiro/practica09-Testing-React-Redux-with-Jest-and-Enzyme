pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the project...'
                sh 'yarn install'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'yarn test --watchAll=false'
            }
        }

        stage('Deploy local') {
            steps {
                echo 'Deploying to local container...'
                sh 'echo Deploying to local environment'
            }
        }

        stage('Deploy Docker') {
            steps {
                echo 'Deploying inside Docker container...'
                sh 'docker build -t my-app .'
                sh 'docker run -d -p 3000:3000 my-app'
            }
        }
    }
}
