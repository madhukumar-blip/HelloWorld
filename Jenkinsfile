pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "mydotnetapi:latest"
    }

    stages {
        stage('Build .NET App') {
            steps {
                echo 'Building .NET App from repository root...'
                sh 'dotnet build --configuration Release'
            }
        }

        stage('Archive Artifacts') {
            steps {
                echo 'Saving compiled build binaries in Jenkins...'
                archiveArtifacts artifacts: 'bin/Release/**', allowEmptyArchive: false
            }
        }

        stage('Docker Build') {
            steps {
                echo "Building Docker container image: ${DOCKER_IMAGE}..."
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }
    }

    post {
        success {
            echo 'All stages completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check stage logs for errors.'
        }
    }
}
