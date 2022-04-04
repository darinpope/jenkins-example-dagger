pipeline {
  agent any
  stages {
    stage('verify installation') {
      steps {
        sh '''
          dagger version
          docker version
        '''
      }
    }
  }
}