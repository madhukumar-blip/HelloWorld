pipeline {
    agent any

    environment {
        BUILD_CONFIG = 'Release'
        IMAGE_NAME   = 'mydotnetapi:latest'
        CONTAINER_NAME = 'my_running_api'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Pulling the latest code from GitHub...'
                checkout scm
            }
        }
        stage('Restore') {
            steps {
                sh 'dotnet restore'
            }
        }
        stage('Build') {
            steps {
                sh "dotnet build --configuration ${BUILD_CONFIG} --no-restore"
            }
        }
        stage('Publish') {
            steps {
                sh "dotnet publish --configuration ${BUILD_CONFIG} --output ./publish --no-build"
            }
        }
        stage('Docker Build & Run') {
            steps {
                echo 'Building Docker Image...'
                sh "docker build -t ${IMAGE_NAME} ."
                
                echo 'Stopping & removing old container if it exists...'
                sh "docker stop ${CONTAINER_NAME} || true"
                sh "docker rm ${CONTAINER_NAME} || true"
                
                echo 'Launching new container...'
                // Runs the API detached (-d) mapping port 5000 of Windows/WSL to 5000 of the container
                sh "docker run -d --name ${CONTAINER_NAME} -p 5000:5000 ${IMAGE_NAME}"
            }
        }
    }
}
