pipeline {
    agent any
    stages {
        stage('Clone the repo') {
            steps {
                echo 'Cloning the repository:'
                //git 'https://github.com/mudit097/node-todo-cicd.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Building the ToDo application on Docker'
                sh 'docker build . -t sample-java-app-image'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the application on Docker'
                sh 'docker rm -f rinki-conta'
                sh 'docker run -p 8081:8000 -d --name rinki-conta sample-java-app-image'
            }
        }
    }
}
