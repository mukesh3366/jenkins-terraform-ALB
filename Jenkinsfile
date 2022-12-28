pipeline {
    agent any
    stages{
        stage('CheckoutCode'){
            steps{
                git branch: 'main', credentialsId: '4e465329-5983-466a-b965-10540726f67a', url: 'https://github.com/mukesh3366/jenkins-terraform-ALB.git'
            }
        }
		stage('BuildImagePushToHub'){
            steps{
                sh "docker build -t mukesh36/ngnix-app-terraform_docker:${env.BUILD_NUMBER} ."
            }
        }  
        stage('logintoDockerHub'){	
            steps{
			withCredentials([string(credentialsId: '5e9d8a06-6542-4812-8ee8-4d481fa9ab86', variable: 'password')]) {
                sh "docker login -u mukesh36 -p ${password}"
                }
                sh "docker push mukesh36/ngnix-app-terraform_docker:${env.BUILD_NUMBER}" 
            }
        }  
        stage('TerraformExecutionToBuildServer'){
            steps{
                sh "terraform init"
                sh "terraform plan"
                sh "terraform apply -auto-approve"
            } 
        } 
       
    }//stages closing
}//pipeline closing  
