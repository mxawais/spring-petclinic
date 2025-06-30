pipeline {
    agent any

    tools {
        maven 'Maven 3.9.9'
        jdk 'JDK 21'
    }

    environment {
        JAR_NAME = 'spring-petclinic-3.4.0-SNAPSHOT.jar'
    }

    stages {

        stage('Pull Code') {
            steps {
                git 'https://github.com/mxawais/spring-petclinic.git'
            }
        }

        stage('Build & Test') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Deploy JAR') {
            steps {
                bat '''
                echo Killing existing spring-petclinic process...
                for /f "tokens=2" %%i in ('tasklist /v ^| findstr spring-petclinic') do taskkill /F /PID %%i

                echo Starting new spring-petclinic app...
                start java -jar target\\%JAR_NAME% --server.port=8081
                '''
            }
        }
    }
}
