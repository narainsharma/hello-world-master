pipeline {
    agent any
    stages {
       
       stage('Cleanup'){
        steps{
            bat 'mvnw.cmd clean'
        }
       }
        stage('Build') { 
            steps {
                bat 'mvnw.cmd install' 
            }
        }
        stage('Test') { 
            steps {
                bat 'mvnw.cmd test' 
            }
        }
    }
}