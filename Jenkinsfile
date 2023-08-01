pipeline {
    agent { label 'jenkins-slave' }
    environment {
        IMAGE = 'nodeapp1'
        TAG = sh(returnStdout: true, script: "git rev-parse --short=10 HEAD").trim()
    }
    stages {
        stage("Clone Git Repository - dev") {
            steps {
                git(
                    url: "https://github.com/ansil1999/test-nodeapp.git",
                    branch: "dev"
                )
            }
        }
        stage('Build - dev') {
            steps {
                sh 'sudo docker build -t ${IMAGE}:${TAG} .'
            }
        }  
        stage('Deploy - dev') {
            steps {
                sh 'sudo docker rm -f nodeaapdev'
                sh 'sudo docker run -dit --name nodeaapdev -p 8081:8082 ${IMAGE}:${TAG}'
                sh 'bash ./cleanup_old_images.sh'
            }
        }
        stage("Clone Git Repository - main") {
            steps {
                git(
                    url: "https://github.com/ansil1999/test-nodeapp.git",
                    branch: "main"
                )
            }
        }
        stage('Build - main') {
            steps {
                sh 'sudo docker build -t ${IMAGE}:${TAG} .'
            }
        }  
        stage('Deploy - main') {
            steps {
                sh 'sudo docker rm -f nodeaap'
                sh 'sudo docker run -dit --name nodeaap -p 8080:8080 ${IMAGE}:${TAG}'
                sh 'bash ./cleanup_old_images.sh'
            }
        }
    }
}
