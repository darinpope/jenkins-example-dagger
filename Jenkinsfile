pipeline {
  agent any
  environment {
    DH_CREDS=credentials('dh-creds')
  }
  stages {
    stage("setup") {
      steps {
        sh '''
          dagger project init
          dagger project update
        '''
      }
    }
    stage("do") {
      steps {
        sh 'dagger do build --log-format=plain'
      }
    }    
  }
}