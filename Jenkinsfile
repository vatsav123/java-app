pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'vatsav123/java-app:latest'  // Docker image name
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
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub using Jenkins credentials
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', 
                                                      usernameVariable: 'DOCKER_USERNAME', 
                                                      passwordVariable: 'DOCKER_PASSWORD')]) {
                        // Docker login command using the injected credentials
                        sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                        
                        // Push the Docker image to Docker Hub
                        sh 'docker push ${DOCKER_IMAGE}'
                    }
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
