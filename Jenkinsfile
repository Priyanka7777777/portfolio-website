pipeline {
    agent any

    environment {
        AWS_REGION = "us-east-1"
        BUCKET_NAME = "priyanka-portfolio-bucket"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/Priyanka7777777/portfolio-website.git'
            }
        }

        stage('Upload to S3') {
            steps {
                sh '''
                aws s3 sync . s3://$BUCKET_NAME --delete --acl public-read --exclude "Jenkinsfile"
                '''
            }
        }
    }
}
