pipeline {
    agent {
        docker {
            image 'maven:3.9-eclipse-temurin-21'
        }
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh 'mvn -f simple-java-app/pom.xml clean package -DskipTests'
            }
        }
        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'simple-java-app/target/*.jar', fingerprint: true
            }
        }
    }
}
