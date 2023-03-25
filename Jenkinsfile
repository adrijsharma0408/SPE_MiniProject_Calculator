pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "Maven"
    }
    
    environment
    {
        registry = "adrijsharma/spe_mini_project_calculator"
        registryCredential = "DockerToken"
        dockerImage = ""
    }

    stages {
        stage('Pull from GitHub') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/adrijsharma0408/SPE_MiniProject_Calculator.git'
            }
        }
        stage('Maven Build') {
            steps {
                // Run Maven on a Unix agent.
                sh "mvn clean install"
            }
        }
        stage('Docker Build Image') {
             steps {
                script {
                    dockerImage = docker.build(registry + ":latest")
                }
            }  
        }
        
         stage('DockerHub Image Push') {
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
        
        stage('Docker Image Remove') {
            steps {
                sh "docker rmi $registry:latest" 
            }
        }
        
        stage('Ansible Pull Image') {
            steps {
                ansiblePlaybook colorized: true,
                installation: 'Ansible',
                inventory: 'inventory',
                playbook: 'playbook.yml'
            }
        }
    }
}
