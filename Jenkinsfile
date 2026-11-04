pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building .NET App from repository root...'
                sh 'dotnet build --configuration Release'
            }
        }
    }
}
