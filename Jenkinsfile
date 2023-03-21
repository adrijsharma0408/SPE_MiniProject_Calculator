pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "Maven"
    }

    stages {
        stage('Clone') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/adrijsharma0408/SPE_MiniProject_Calculator.git'
            }
        }
        stage('Build') {
            steps {
                // Run Maven on a Unix agent.
                sh "mvn clean install"
            }
        }
//         stage('Docker Image') {
//             steps {
//                 script {
//                     dockerImage = docker.build(registry + ":latest")
//                 }
//             }
//         }
    }
}
