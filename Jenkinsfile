pipeline {
    agent any
    stages {
         stage('Init') { 
            steps {
                echo 'hello!' 
            }
        }
        stage('Build') { 
            steps {
                bat 'mvn clean install' 
            }
        }
    }
}