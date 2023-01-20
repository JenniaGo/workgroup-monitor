pipeline {
    agent any
    stages {
        stage('Clone Git Repo') {
            steps {
                git 'https://github.com/JenniaGo/workgroup-monitor.git'
            }
        }
        stage('Run Ansible Playbook') {
            steps {
                sh 'ansible-playbook -i inventory.txt playbook.yml'
            }
        }
    }
}
