pipeline {
    agent any
    stages {
       
       stage('Cleanup'){
        steps{
            bat 'mvnw.cmd clean'
        }
       }
       stage('Test'){ 
        steps {
            bat 'mvnw.cmd test' 
        }
        post{
            always{
                junit 'target/surefire-reports/*.xml'
            }
        }
       }
       stage('Build') { 
            steps {
                bat 'mvnw.cmd install' 
            }
        }  
    }
}