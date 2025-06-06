pipeline {
    agent any

    environment {
        AWS_CREDENTIALS = credentials('aws-credentials-id')
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/Priyanka7777777/portfolio-website.git', branch: 'main'
            }
        }

        stage('Upload to S3') {
            steps {
                withEnv([
                    "AWS_ACCESS_KEY_ID=${env.AWS_CREDENTIALS_USR}",
                    "AWS_SECRET_ACCESS_KEY=${env.AWS_CREDENTIALS_PSW}"
                ]) {
                    sh '''
                    aws s3 cp ./ s3://your-s3-bucket-name/ --recursive --acl public-read
                    '''
                }
            }
        }
    }

    post {
        failure {
            echo '❌ Deployment failed. Check logs above.'
        }
    }
}
