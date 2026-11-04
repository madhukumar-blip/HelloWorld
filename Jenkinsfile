pipeline {
    agent any

    environment {
        BUILD_CONFIG = 'Release'
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
                echo 'Restoring project dependencies...'
                sh 'dotnet restore'
            }
        }
        stage('Build') {
            steps {
                echo 'Compiling the .NET Core Web API...'
                sh "dotnet build --configuration ${BUILD_CONFIG} --no-restore"
            }
        }
        stage('Publish') {
            steps {
                echo 'Publishing build artifacts...'
                sh "dotnet publish --configuration ${BUILD_CONFIG} --output ./publish --no-build"
            }
        }
    }
}
