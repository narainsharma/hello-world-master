pipeline {
    agent {
     docker {
          image 'maven:3-alpine'
          args '-v $HOME/.m2:/root/.m2'
      }
    }    

    environment {
    APP_NAME= 'hello-world-master'
    APP_IMAGE_VERSION ='1.0'
    IMAGE_TAG = "$APP_NAME:$APP_IMAGE_VERSION-$BUILD_NUMBER"
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
    stage('Build'){
      steps{
        sh 'mvn package'
      }
    }

    stage('Build Docker Image'){
      steps{

        sh 'docker build -t test_image .'
      }
    }
  }
}