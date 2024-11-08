pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'srivatsav0909/my-java-app:latest' // Update to your Docker repository
        DOCKER_USERNAME = 'srivatsav0909'               // Docker username
        DOCKER_PASSWORD = 'Chinnu@0909'                 // Docker password
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from Git repository
                git url: 'https://github.com/vatsav123/my-java-app.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                script {
                    // Run Maven build (make sure to have pom.xml in your project)
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
