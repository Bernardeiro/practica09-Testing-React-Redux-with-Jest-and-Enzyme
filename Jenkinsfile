pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        echo 'Instalando dependencias...'
        sh 'yarn install'
      }
    }

    stage('Test') {
      steps {
        echo 'Ejecutando tests...'
        sh 'yarn test --watchAll=false'
      }
    }
  }
}
