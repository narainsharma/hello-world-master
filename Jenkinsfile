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
                set M2_HOME=C:\Users\narain.sharma\Desktop\apache-maven-3.6.3
                set path=C:\Users\narain.sharma\Desktop\apache-maven-3.6.3\bin:%path%;
                bat 'mvn -B -DskipTests clean package' 
            }
        }
    }
}