pipeline {
    agent { label 'jenkins-slave' }
    environment {
        IMAGE = 'nodeapp'
        TAG = sh(returnStdout: true, script: "git rev-parse --short=10 HEAD").trim()
    }
    stages {
        stage("Clone Git Repository") {
            steps {
                git(
                    url: "https://github.com/ansil1999/node-app.git",
                    branch: "main"
                )
            }
        }
        stage('Build') {
            steps {
                sh 'sudo docker rm -f nodeaap'
                sh 'sudo docker build -t ${IMAGE}:${TAG} .'
            }
        }  
        stage('Deploy') {
            steps {
                sh 'sudo docker run -dit --name nodeaap -p 8080:8080 ${IMAGE}:${TAG}'
                sh 'bash ./cleanup_old_images.sh'
            }
        }
    }
}
