nano Jenkinsfile
pipeline {
    agent any

    environment {
        BUILD_CONFIG = 'Release'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Pulling the latest code from repository...'
                checkout scm
            }
        }
        stage('Restore Dependencies') {
            steps {
                echo 'Restoring NuGet packages...'
                sh 'dotnet restore'
            }
        }
        stage('Build Application') {
            steps {
                echo "Compiling the project in ${BUILD_CONFIG} mode..."
                sh "dotnet build --configuration ${BUILD_CONFIG} --no-restore"
            }
        }
        stage('Publish Artifacts') {
            steps {
                echo 'Publishing the web API project...'
                sh "dotnet publish --configuration ${BUILD_CONFIG} --output ./publish --no-build"
            }
        }
    }
}
