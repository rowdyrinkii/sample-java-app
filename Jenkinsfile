pipeline {
    agent any
    stages {
        stage('Build and Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'ecr-demo-credentials', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        // Login to ECR
                        sh "aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 387620062696.dkr.ecr.ap-south-1.amazonaws.com"

                        // Build Docker image with default latest tag
                        sh "docker build -t test/firstcodedeploy ."

                        // Tag Docker image with tag latest and repo name 
                        sh "docker tag test/firstcodedeploy:latest 387620062696.dkr.ecr.ap-south-1.amazonaws.com/test/firstcodedeploy:latest"

                        // Push latest tag Docker image to ECR
                        sh "docker push 387620062696.dkr.ecr.ap-south-1.amazonaws.com/test/firstcodedeploy:latest"

                        // Tag Docker image with tag Build number and repo name 
                        sh "docker tag test/firstcodedeploy:latest 387620062696.dkr.ecr.ap-south-1.amazonaws.com/test/firstcodedeploy:${BUILD_TAG}"

                        // Push Build number tag Docker image to ECR
                        sh "docker push 387620062696.dkr.ecr.ap-south-1.amazonaws.com/test/firstcodedeploy:${BUILD_TAG}"
                        
                        // remove all tags images from ec2 jenkins machine docker cache
                        sh "docker image rm test/firstcodedeploy:latest 387620062696.dkr.ecr.ap-south-1.amazonaws.com/test/firstcodedeploy:latest 387620062696.dkr.ecr.ap-south-1.amazonaws.com/test/firstcodedeploy:${BUILD_TAG}"

                    }
                }
            }
        }//

        stage('Deploy to EKS'){
            steps {

                echo "Deploying to EKS"
                sh "aws eks update-kubeconfig --region ap-south-1 --name test-cluster-01"
                ls
                pwd
            }
                
        }
            
    }
}
