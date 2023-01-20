pipeline {
    agent { label 'ansible-controller' }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-repo/ansible-project.git'
            }
        }
        stage('Run Ansible') {
            steps {
                ansiblePlaybook colorized: true,
                    inventory: 'inventory.txt',
                    playbook: 'playbook.yml'
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: '*.log'
        }
        success {
            mail to: 'team@example.com',
                subject: "Nagios Deployment Successful",
                body: "The Nagios deployment on the workgroup computers was successful."
        }
        failure {
            mail to: 'team@example.com',
                subject: "Nagios Deployment Failed",
                body: "The Nagios deployment on the workgroup computers failed. Please check the logs for more information."
        }
    }
}
