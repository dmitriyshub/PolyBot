pipeline {
    agent any

//     environment {
//         REGISTRY_URL = "352708296901.dkr.ecr.eu-west-2.amazonaws.com"
//         IMAGE_TAG = "0.0.$BUILD_NUMBER"
//         IMAGE_NAME = "dmitriyshub-jenkins"
//
//     }

    stages {
        }
        stage('Build Bot app') {
            steps {
                sh '''
                   aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 352708296901.dkr.ecr.eu-west-2.amazonaws.com
                   docker build -t dmitriyshub-jenkins:$BUILD_NUMBER .
                   docker tag dmitriyshub-jenkins:$BUILD_NUMBER 352708296901.dkr.ecr.eu-west-2.amazonaws.com/dmitriyshub-jenkins:$BUILD_NUMBER
                   docker push 352708296901.dkr.ecr.eu-west-2.amazonaws.com/dmitriyshub-jenkins:$BUILD_NUMBER
                   '''
            }
        }
    }
}