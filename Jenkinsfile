pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "mydotnetapi:latest"
    }

    stages {
        stage('Build .NET App') {
            steps {
                echo 'Cleaning up any left-over build artifacts...'
                sh 'git clean -xdff'
                
                echo 'Building .NET App from repository root...'
                sh 'dotnet build --configuration Release'
            }
        }

        stage('Archive Artifacts') {
            steps {
                echo 'Saving compiled build binaries in Jenkins...'
                archiveArtifacts artifacts: 'bin/Release/net10.0/**', allowEmptyArchive: true
            }
        }

        stage('Docker Build') {
            steps {
                echo "Building Docker container image: ${DOCKER_IMAGE}..."
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        stage('Deploy Container') {
            steps {
               echo 'Stopping old container and launching the new version...'
               sh 'docker rm -f my-running-api || true'
               sh 'docker run -d -p 5000:8080 --name my-running-api mydotnetapi:latest'
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
