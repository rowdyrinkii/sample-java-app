pipeline {
    agent any
    stages {
        stage('Clone the repo') {
            steps {
                echo 'Cloning the repository: Not needed because it is linked to git'
                //git 'https://github.com/mudit097/node-todo-cicd.git'
            }
        }
        stage('Build & deploy') {
            steps {

                    sh ''' sshpass -p dockeruser ssh -o StrictHostKeyChecking=no dockeruser@13.201.168.105 /bin/bash -s << EOT
                    pwd
                    ls -lrth
                    docker build . -t sample-java-app-image2 &&
                    docker rm -f rinki-conta &&
                    docker run -p 8091:8080 -d --name rinki-conta sample-java-app-image2
                    '''
            }
        }
    }
}
