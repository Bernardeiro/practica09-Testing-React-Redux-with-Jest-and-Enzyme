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
    
    stage('Reporting - Code Churn') {
		steps {
			script {
				def timestamp = new Date().format("yyyyMMdd_HHmmss")
				def filename = "code_churn_${timestamp}.txt"
				sh """
					echo 'Informe de Code Churn' > ${filename}
					echo '======================' >> ${filename}
					git log --since="7 days ago" --pretty=tformat: --numstat >> ${filename}
					echo 'Archivo generado: ${filename}'
					cat ${filename}
				"""
			}
		}
	}
  }
}
