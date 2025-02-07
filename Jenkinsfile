pipeline {
    agent any

    environment {
        KUBECONFIG = "/var/lib/jenkins/.kube/config"  // Ensure correct path
        MINIKUBE_HOME = "/var/lib/jenkins/.minikube"  // Set Minikube home for Jenkins
    }

    stages {
        stage('Setup Minikube Context') {
            steps {
                script {
                    sh '''
                    set -e  # Exit on error
                    
                    echo "🔄 Switching to Minikube context..."
                    kubectl config use-context minikube

                    echo "✅ Minikube context set successfully!"
                    '''
                }
            }
        }
    }
}
