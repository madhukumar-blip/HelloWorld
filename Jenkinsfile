pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building .NET App...'
                dir('MyDotNetApi') {
                    sh 'dotnet build --configuration Release'
                }
            }
        }
    }
}
