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

    }
}