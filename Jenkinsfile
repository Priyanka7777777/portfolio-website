
pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'  // update if your bucket is in a different region
        S3_BUCKET = 'priyanka-portfolio-bucket'  // ✅ replace with your actual bucket name
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/Priyanka7777777/portfolio-website.git', branch: 'main'
            }
        }

        stage('Install AWS CLI (if not installed)') {
            steps {
                sh '''
                if ! command -v aws &> /dev/null
                then
                    echo "AWS CLI not found, installing..."
                    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
                    unzip awscliv2.zip
                    sudo ./aws/install
                fi
                aws --version
                '''
            }
        }

        stage('Upload to S3') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                ]]) {
                    sh '''
                    aws s3 sync . s3://$S3_BUCKET/ --delete --region $AWS_REGION
                    '''
                }
            }
        }
    }

    post {
        success {
            echo "✅ Deployment successful!"
        }
        failure {
            echo "❌ Deployment failed. Check the logs above."
        }
    }
}
