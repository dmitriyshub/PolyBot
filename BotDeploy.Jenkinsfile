properties([parameters([string('BOT_IMAGE_NAME')])])

pipeline {
    agent any

    stages {
        stage('Build Bot app') {
            steps {
                sh '''
                   echo "deploy"
                   '''
            }

        }
        stage("Install Ansible") {
            steps {
                sh 'python3 -m pip install ansible'
                sh '/var/lib/jenkins/.local/bin/ansible-galaxy collection install community.general'
            }
        }
        stage("Generate Ansible Inventory") {
            environment {
                BOT_EC2_APP_TAG = "dmitriyshub-app"
                BOT_EC2_REGION = "us-east-1"
            }
            steps {
                sh 'aws ec2 describe-instances --region $BOT_EC2_REGION --filters "Name=tag:App,Values=$BOT_EC2_APP_TAG" --query "Reservations[].Instances[]" > hosts.json'
                sh 'python3 prepare_ansible_inv.py'
                sh '''
                echo "Inventory generated"
                cat hosts
                '''
            }
        }

        stage('Ansible Bot Deploy') {
            environment {
                ANSIBLE_HOST_KEY_CHECKING = 'False'
                REGISTRY_URL = '352708296901.dkr.ecr.eu-west-2.amazonaws.com'
                REGISTRY_REGION = 'eu-west-2'
            }

            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'bot-instances', usernameVariable: 'ssh_user', keyFileVariable: 'privatekey')]) {
                sh '''
                /var/lib/jenkins/.local/bin/ansible-playbook botDeploy.yaml --extra-vars "registry_region=$REGISTRY_REGION  registry_url=$REGISTRY_URL bot_image=$BOT_IMAGE_NAME" --user=${ssh_user} -i hosts --private-key ${privatekey}
                '''

                }
            }
        }
    }
}