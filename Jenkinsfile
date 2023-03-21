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
        stage('Clone') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/adrijsharma0408/SPE_MiniProject_Calculator.git'
            }
        }
        stage('maven Build') {
            steps {
                // Run Maven on a Unix agent.
                sh "mvn clean install"
            }
        }
        stage('Docker build Image') {
             steps {
                script {
                    dockerImage = docker.build(registry + ":latest")
                }
            }
            
        }
    }
}
