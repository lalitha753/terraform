pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/lalitha753/terraform.git', branch: 'main'
            }
        }

        stage('List Files') {
            steps {
                sh 'ls -l'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }
    }
}
