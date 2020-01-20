pipeline {
    agent any

    environment {
    APP_NAME= 'hello-world-master'
    APP_IMAGE_VERSION ='1.0'
    IMAGE_TAG = "$APP_NAME:$APP_IMAGE_VERSION-$BUILD_NUMBER"
    }

    stages {    

      stage('Clean, Test and Build'){
        agent {
          docker {
          image 'maven:3-alpine'
          }
        }

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
    }  
       
    stage('Build Docker Image'){
      agent any
      steps{

        sh 'docker build -t test_image .'
      }
    }
  }
}