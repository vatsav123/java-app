pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'srivatsav0909/my-java-app:latest'  // Docker image name
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub repository using stored credentials
                git(
                    url: 'https://github.com/vatsav123/my-java-app.git',
                    branch: 'new-branch',  // Update with your branch name
                    credentialsId: 'github-credentials'  // Use the credentials ID for GitHub access (Personal Access Token)
                )
            }
        }

        stage('Build') {
            steps {
                script {
                    // Run Maven build
                    sh 'mvn clean install'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Run tests using Maven
                    sh 'mvn test'
                }
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    // Build the Docker image
                    sh '''
                        docker build -t ${DOCKER_IMAGE} .
                    '''
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub using Jenkins credentials and push the image
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', 
                                                       usernameVariable: 'DOCKER_USERNAME', 
                                                       passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh '''
                            echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
                            docker push ${DOCKER_IMAGE}
                        '''
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Example deployment, modify this step as per your deployment strategy
                    echo 'Deploying the app'
                }
            }
        }
    }

    post {
        success {
            echo 'Build and deployment were successful!'
        }
        failure {
            echo 'Build or deployment failed. Check logs for errors.'
        }
    }
}
