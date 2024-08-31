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
                //run this command on ec2 machine -- sudo usermod -aG docker jenkins && sudo systemctl restart docker && sudo systemctl restart jenkins to mke sure that jenkins is able to use docker running on ec2 machine
                sh 'docker build . -t sample-java-app-image'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the application on Docker'
                sh 'docker run -p 8000:8080 -d --name rinki-cont sample-java-app-image'
            }
        }
    }
}
