pipeline {

    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
    }

    agent any

    environment {
        // Define any necessary environment variables here
        // For example, AWS credentials if using AWS
        AWS_ACCESS_KEY_ID = credentials('aws-terraform-user')
        AWS_SECRET_ACCESS_KEY = credentials('aws-terraform-user')
    }


    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from your version control system
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                // Initialize Terraform
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                // Run Terraform plan
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                // Apply the Terraform plan with auto-approval
                sh 'terraform apply -auto-approve tfplan'
            }
        }
        stage('Terraform Destroy') {
            steps {
                // Apply the Terraform plan with auto-approval
                sh 'terraform destroy -auto-approve tfplan'
            }
        }
    
    }

    post {
        always {
            // Cleanup actions, if any
            // For example, removing temporary files
            cleanWs()
        }
        success {
            // Actions to perform if the pipeline succeeds
            echo 'Terraform apply succeeded.'
        }
        failure {
            // Actions to perform if the pipeline fails
            echo 'Terraform apply failed.'
        }
    }
}
