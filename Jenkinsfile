pipeline {
    agent any

    environment {
        REGISTRY_URL = "352708296901.dkr.ecr.eu-west-2.amazonaws.com"
        IMAGE_TAG = "0.0.$BUILD_NUMBER"
        IMAGE_NAME = "dmitriyshub-jenkins"

    }

    stages {

        stage('Build Bot app') {
            steps {
                sh '''
                   aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 352708296901.dkr.ecr.eu-west-2.amazonaws.com
                   docker build -t $IMAGE_NAME:$BUILD_NUMBER .
                   docker tag $IMAGE_NAME:$BUILD_NUMBER $REGISTRY_URL/$IMAGE_NAME:$BUILD_NUMBER
                   docker push $REGISTRY_URL/$IMAGE_NAME:$BUILD_NUMBER
                   '''
            }
            post {
                always {
                    sh '''
                    docker image prune -f --filter "label=app=bot"
                    '''
                }
            }
        }
    }
}