pipeline {
    environment {
        dockerImageName = "mb2122/chucknorris"
    }

    agent any

    stages {
        stage('Checkout Source') {
            steps {
                git 'https://github.com/MANSSII/chucknorris'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    dockerImage = docker.build dockerImageName
                }
            }
        }

        stage('Push Image to Docker Hub') {
            environment {
                registryCredential = 'dockerhubcredentials'
            }

            steps {
                script {
                    // Push Docker image to Docker Hub
                    docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Deploy to Kubernetes
                    kubernetesDeploy(
                        kubeconfigId: 'your-kubeconfig-id',
                        configs: ['deployment.yaml', 'service.yaml']
                    )
                }
            }
        }
    }
}

