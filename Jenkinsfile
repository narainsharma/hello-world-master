pipeline {
    agent any

    environment {
    APP_NAME= 'hello-world-master'
    APP_IMAGE_VERSION ='1.0'
    NEXUS_HOST = 'mgmt-ingress-alb-353051769.us-east-1.elb.amazonaws.com:8082'
    IMAGE_TAG = "$APP_NAME:$APP_IMAGE_VERSION-$BUILD_NUMBER-${env.GIT_COMMIT.take(8)}"
    }

    stages {    

      stage('Clean Test Build'){
        agent {
          docker {
          image 'maven:3-alpine'
          }
        }

        stages{
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
      }
        
    stage('Build Docker Image'){
      steps{       
         sh """
            docker build . -t $IMAGE_TAG
            docker images --filter "dangling=true"
            docker image prune -f
            """
      }
    }
    stage('Push Docker Image to Nexus'){
      steps {
              withCredentials([usernamePassword(credentialsId: 'nexus3-jenkins-user', passwordVariable: 'JENKINS_NEXUS_PASSWORD', usernameVariable: 'JENKINS_NEXUS_USER')]) {
                sh """
                    docker login $NEXUS_HOST --username $JENKINS_NEXUS_USER --password $JENKINS_NEXUS_PASSWORD
                    docker -D tag $IMAGE_TAG $NEXUS_HOST/$IMAGE_TAG
                    docker -D push $NEXUS_HOST/$IMAGE_TAG
                    """
                }
            }
        }
  }
}