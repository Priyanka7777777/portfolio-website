
pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1' // Change this to your AWS region
        S3_BUCKET = 'priyanka-portfolio-bucket' // Change to your actual bucket name
        AWS_CREDENTIALS = credentials('aws-credentials-id') // Jenkins credential ID for AWS access keys
    }

    stages {
        stage('Checkout Code') {
            steps {
                git(
                    url: 'https://github.com/Priyanka7777777/portfolio-website.git',
                    credentialsId: 'github-credentials-id', // Replace with your Jenkins GitHub credential ID
                    branch: 'main'
                )
            }
        }

        stage('Install AWS CLI (if needed)') {
            steps {
                script {
                    def awsCliExists = sh(script: "which aws", returnStatus: true) == 0
                    if (!awsCliExists) {
                        echo "AWS CLI not found, installing in user space..."
                        sh '''
                        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
                        unzip awscliv2.zip
                        ./aws/install -i $HOME/aws-cli -b $HOME/.local/bin/aws
                        '''
                        // Add ~/.local/bin to PATH for this pipeline
                        env.PATH = "${env.HOME}/.local/bin:${env.PATH}"
                    } else {
                        echo "AWS CLI found."
                    }
                }
            }
        }

        stage('Upload to S3') {
            steps {
                withEnv(["AWS_ACCESS_KEY_ID=${AWS_CREDENTIALS_USR}", "AWS_SECRET_ACCESS_KEY=${AWS_CREDENTIALS_PSW}", "AWS_DEFAULT_REGION=${AWS_REGION}"]) {
                    sh """
                    aws s3 sync ./ s3://${S3_BUCKET} --delete
                    """
                }
            }
        }
    }

    post {
        success {
            echo "✅ Deployment successful!"
        }
        failure {
            echo "❌ Deployment failed. Check logs above."
        }
    }
}


