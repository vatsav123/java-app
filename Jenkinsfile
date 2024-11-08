pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'srivatsav0909/my-java-app:latest'
        DOCKER_USERNAME = 'srivatsav0909'
        DOCKER_PASSWORD = 'Chinnu@0909'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from the new branch
                git url: 'https://github.com/vatsav123/my-java-app.git', branch: 'new-branch'
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
                    // Log in to Docker Hub and push the image
                    sh '''
                        echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
                        docker push ${DOCKER_IMAGE}
                    '''
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Example deployment
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
