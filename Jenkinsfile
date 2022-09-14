pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'echo building...'
            }
        }
        stage('Stage II') {
            steps {
                sh 'echo "stage II..."'
            }
        }
        stage('Stage III ...') {
            steps {
                sh 'echo echo "stage III..."'
            }
        }
        stage('Build Bot app') {
            steps {
                sh '''
                   aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 352708296901.dkr.ecr.eu-west-2.amazonaws.com
                   docker build -t dmitriyshub-jenkins:$BUILD_NUMBER .
                   docker tag dmitriyshub-jenkins:$BUILD_NUMBER 352708296901.dkr.ecr.eu-west-2.amazonaws.com/dmitriyshub-jenkins:$BUILD_NUMBER
                   ddocker push 352708296901.dkr.ecr.eu-west-2.amazonaws.com/dmitriyshub-jenkins:$BUILD_NUMBER
                   '''
            }
        }
    }
}