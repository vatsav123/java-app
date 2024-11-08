pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'vatsav123/java-app:latest' // Docker image name
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from Git repository
                git url: 'https://github.com/vatsav123/java-app.git', branch: 'main'
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
                    // Run tests using Maven (optional if you have test cases)
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
                    // Push the Docker image to Docker Hub (make sure you're logged in)
                    sh '''
                        docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
                        docker push ${DOCKER_IMAGE}
                    '''
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Example deployment (could be different based on your setup)
                    echo 'Deploying the app'
                    // Add deployment commands here (e.g., using Docker or any other method)
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
