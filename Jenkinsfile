pipeline {
    agent {
      docker {
          image 'maven:3-alpine'
          args '-v $HOME/.m2:/root/.m2'
      }
    }    

    environment {
    HOME = '.'
    }

    stages {      
       stage('Cleanup'){
        steps{
            sh 'mvn clean'
        }
       }
       stage('Test'){
        steps{
          sh 'mvn test'
        }
        post{
          always {
                    junit 'target/surefire-reports/*.xml'
          }
       } 
    }
  }
}