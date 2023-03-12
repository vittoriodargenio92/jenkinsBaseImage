pipeline {
    agent { docker { image 'dind' } }
    stages {
        stage('build') {
            steps {
                sh 'docker build -t dockerBaseImage:latest .'
            }
        }
    }
}