pipeline {
    agent any
    environment {
        AWS_REGION = 'us-east-1'
        BUCKET_NAME = 'priyanka-portfolio-bucket'
    }
    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/Priyanka7777777/portfolio-website.git', branch: 'main'
            }
        }
        stage('Upload to S3') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding', 
                    credentialsId: 'aws-credentials-id'
                ]]) {
                    sh '''
                    aws configure set region $AWS_REGION
                    aws s3 cp ./index.html s3://priyanka-portfolio-bucket/index.html

                    '''
                }
            }
        }
    }
    post {
        failure {
            echo "❌ Deployment failed. Check logs above."
        }
    }
}
