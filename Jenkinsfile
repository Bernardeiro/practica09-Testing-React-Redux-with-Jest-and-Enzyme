pipeline {
    agent any

    triggers {
        pollSCM('H/15 * * * *')
    }

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
                //sh 'yarn start &'
            }
        }

        stage('Deploy Docker') {
            steps {
                echo 'Deploying inside Docker container...'
                sh 'fuser -k 3000/tcp || true'
                sh 'docker rm -f my-app-container || true'
                sh 'docker build -t my-app .'
                sh 'docker run -d --name my-app-container -p 3000:3000 my-app'
            }
        }

        // NUEVO STAGE para el KPI: Cobertura
        stage('KPI Report - Code Coverage') {
            steps {
                script {
                    def timestamp = new Date().format("yyyyMMdd_HHmmss")
                    sh """
                        mkdir -p kpi_reports
                        yarn test --coverage --watchAll=false
                        cp -r coverage/lcov-report kpi_reports/coverage_${timestamp}
                        echo "Informe de cobertura guardado en: kpi_reports/coverage_${timestamp}"
                    """
                }
            }
        }
    }
}
