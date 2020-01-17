pipeline {
    agent any
    environment {
    HOME = '.'
    }

    stages {      
       stage('Cleanup'){
        steps{
            sh './mvnw clean'
        }
       } 
    }
}