pipeline {
  agent any
  stages {
    stage("setup") {
      steps {
        sh 'dagger project init'
        sh 'dagger project update'
      }
    }
    stage("do") {
      steps {
        sh 'dagger do hello --log-format=plain'
      }
    }
  }
}