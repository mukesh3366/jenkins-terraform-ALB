pipeline {
    agent any
	//tools{
         //terraform 'terraform'
    //}
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
			withCredentials([string(credentialsId: 'pass_hub', variable: 'password')]) {
                sh "docker login -u mukesh36 -p ${password}"
                }
                sh "docker push mukesh36/ngnix-app-terraform_docker:${env.BUILD_NUMBER}" 
            }
        }  
        stage('terraform format check') {
            steps{
                sh 'terraform fmt'
            }
        }
        stage('terraform Init') {
            steps{
                sh 'terraform init'
            }
        }
        stage('terraform apply') {
            steps{
                sh 'terraform destroy --auto-approve'
            }
        }
    }//stages closing
}//pipeline closing  
