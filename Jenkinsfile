pipeline {
    agent any

    stages {
        stage('CI') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                sh """
                docker build . -f Dockerfile -t paulahakeem/webportal:v1 --network host
                docker login -u ${USERNAME} -p ${PASSWORD}
                docker push paulahakeem/webportal:v1
                """
                }
            }
        }
         stage('CD') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                sh """
                kubectl apply -f /var/jenkins_home/workspace/webportal/deploy1.yaml
                kubectl apply -f /var/jenkins_home/workspace/webportal/lb.yaml
                """
                }
            }
        }
    }
}