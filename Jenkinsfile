pipeline {
    agent { label 'jenkins-slave' }
    environment {
        IMAGE = 'nodeapp1'
        TAG = sh(returnStdout: true, script: "git rev-parse --short=10 HEAD").trim()
    }
    stages {
        stage("Clone Git Repository") {
            steps {
                git(
                    url: "https://github.com/ansil1999/test-nodeapp.git",
                    branch: "dev"
                )
            }
        }
        stage('Build') {
            steps {
                sh 'sudo docker build -t ${IMAGE}:${TAG} .'
            }
        }  
        stage('Deploy') {
            steps {
                sh 'sudo docker rm -f nodeaapdev'
                sh 'sudo docker run -dit --name nodeaapdev -p 8080:8082 ${IMAGE}:${TAG}'
                sh 'bash ./cleanup_old_images.sh'
            }
        }
    }
}
