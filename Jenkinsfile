node {
 stage('init') {
    checkout scm
  }
  
 stage('build') {
    sh 'mvn clean package'
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
 stage("Publish to Azure") {
       steps {
       azureWebAppPublish appName: "javaapp-dockerhub",
       azureCredentialsId: "springbootapp-sp",
       publishType: "file",
       filePath: "**/*.*",
       resourceGroup: "javadcoker-RG",
       sourceDirectory: "."
           }
   }
}
