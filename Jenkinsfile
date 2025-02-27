pipeline {
    agent any
    stages {
        stage ("Clone the code") {
            steps {
                echo "Cloning the code..."
                git branch: 'main', url: 'https://github.com/aryamanditinus/one.git'
                echo "Code clone successful."
            }
        }
        
        stage ("Build the Image") {
            steps {
                echo "Building the Docker image..."
                sh "docker build -t web-image ."
            }
        }
        
        stage ("Push the docker image to docker hub") {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerHub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh """
                            echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                            docker tag web-image $DOCKER_USER/web-image:latest
                            docker push $DOCKER_USER/web-image:latest
                            docker logout
                        """
                    }
                }
            }
        }
    }
}

