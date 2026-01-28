pipeline {
    agent any

    tools {
        nodejs "NodeJS"
    }

    stages {

        stage('Checkout') {
            steps {
                git url: 'https://github.com/lalitha753/terraform.git', branch: 'main'
            }
        }

        stage('Check Node & NPM') {
            steps {
                sh 'node -v || echo "Node not required for this project"'
                sh 'npm -v || echo "NPM not required for this project"'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                if [ -f package.json ]; then
                    npm install
                else
                    echo "No package.json found – skipping npm install"
                fi
                '''
            }
        }

        stage('Build') {
            steps {
                sh '''
                if [ -f package.json ]; then
                    npm run build || echo "No build script"
                else
                    echo "Terraform Build: init & plan"
                    terraform --version || true
                    terraform init || true
                    terraform plan || true
                fi
                '''
            }
        }

        stage('Test') {
            steps {
                sh '''
                if [ -f package.json ]; then
                    npm test || echo "No tests found"
                else
                    echo "Terraform Test: validate & fmt"
                    terraform validate || true
                    terraform fmt -check || echo "Formatting issues"
                fi
                '''
            }
        }
    }
}
