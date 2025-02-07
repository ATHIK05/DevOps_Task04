pipeline {
    agent any
    stages {
        stage('Deploy to Minikube') {
            steps {
                script {
                    withEnv(["KUBECONFIG=/var/lib/jenkins/.kube/config"]) {
                        sh 'kubectl config use-context minikube'
                        sh 'kubectl get nodes'
                    }
                }
            }
        }
    }
}
