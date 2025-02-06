pipeline {
    agent any

    environment {
        KUBECONFIG = "/path/to/kubeconfig"  // Path to your kubeconfig file
    }

    stages {
        stage('Deploy to Minikube') {
            steps {
                script {
                    sh '''
                    # Make sure the correct context is selected for Minikube
                    kubectl config use-context minikube
                    
                    # Now apply your deployment and service files
                    kubectl apply -f deployment.yaml --validate=false
                    kubectl apply -f service.yaml --validate=false
                    '''
                }
            }
        }
    }
}
