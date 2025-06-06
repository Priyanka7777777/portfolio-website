
pipeline {
    agent any

    environment {
        BUCKET_NAME = 'priyanka-portfolio-bucket'
        AWS_REGION = 'us-east-1'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git credentialsId: 'github-credentials-id', url: 'https://github.com/Priyanka7777777/portfolio-website.git', branch: 'main'
            }
        }

        stage('Upload to S3') {
            environment {
                AWS_ACCESS_KEY_ID = credentials('aws-credentials-id')
                AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
            }
            steps {
                sh '''
                    echo "Uploading website to S3..."
                    aws s3 sync . s3://$BUCKET_NAME --region $AWS_REGION --delete
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Deployment completed successfully!'
        }
        failure {
            echo '❌ Deployment failed. Check logs above.'
        }
    }
}


