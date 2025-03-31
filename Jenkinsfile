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
                sh 'yarn start &'  // Ejecuta la app en segundo plano
            }
        }

        stage('Deploy Docker') {
            steps {
                echo 'Deploying inside Docker container...'
                sh 'docker rm -f my-app-container || true'
                sh 'docker build -t my-app .'
                sh 'docker run -d --name my-app-container -p 3000:3000 my-app'
            }
        }
    }
}
