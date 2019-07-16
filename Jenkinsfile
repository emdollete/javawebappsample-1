#!groovy

pipeline {
 agent any
  stages {
    stage('Maven Install') {
       steps {
           sh 'mvn clean package -DskipTests'
	      }
	        }
		  stage('Docker Build and Push') {
		  agent {label 'docker'}
		        steps {
				withCredentials([usernamePassword(credentialsId: 'dockerhub-test', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
				sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
			    sh 'docker build -f ./Dockerfile -t emdollete/calculator:latestcalc .'
				sh 'docker push emdollete/calculator:latestcalc'
				}
			       }
			         }
}
}

