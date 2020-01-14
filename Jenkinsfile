pipeline {
    agent any
     environment {
        PATH="%PATH%;C:\\Users\\narain.sharma\\Desktop\\apache-maven-3.6.3\\bin"
    }
    stages {
         stage('Init') { 
            steps {
                echo 'hello!' 
                echo ${PATH}
            }
        }
        stage('Build') { 
            steps {
                bat 'mvn clean package' 
            }
        }
    }
}