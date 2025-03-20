pipeline {
    agent any

    environment {
        TARGET_DIR = '/opt/zero_guard'
        INVENTORY = 'inventory.yaml'
        PLAYBOOK = 'kong_playbook.yml'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/Haggag-22/zero_guard.git', branch: 'main'
            }
        }
        stage('Sync Code to Target') {
            steps {
                // Use rsync (or similar) to copy files to the target machine.
                // This step is optional if your code is already managed on the target.
                sh """
                   rsync -avz --delete . pep@192.168.1.10:${TARGET_DIR}/
                   """
            }
        }
        stage('Deploy with Ansible') {
            steps {
                // Run the Ansible playbook on the target machine
                sh "ansible-playbook -i ${INVENTORY} ${PLAYBOOK}"
            }
        }
    }
    
    post {
        success {
            echo 'Deployment succeeded.'
        }
        failure {
            echo 'Deployment failed. Check the logs for details.'
        }
    }
}
