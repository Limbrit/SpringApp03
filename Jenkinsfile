node {
    try{
        notify('Started')
        stage('Downloading') {
<<<<<<< HEAD
		git 'https://github.com/Limbrit/SpringApp03.git'
=======
        git 'https://github.com/Limbrit/SpringApp03.git'
>>>>>>> ac2bee66360a4af10ef338949a3a9a9eedbb1a9f
        }
        
        dir('spring-boot-samples/spring-boot-sample-atmosphere/') {
            stage('Clean') {
            sh 'mvn clean'
            }
            stage('Compile') {
            sh 'mvn clean'
            }
            stage('Test') {
            sh 'mvn compile'
            }
            stage('Package') {
            sh 'mvn package'
            }
			stage('Build Docker Image'){
			sh 'sudo docker build -t limbrit/my-app001:0.0.1 .'
			}
			stage('Push Docker Image'){
			withCredentials([string(credentialsId: 'DockerHUB', variable: 'MyDockerHub')]) {
				sh "sudo docker login -u limbrit -p ${MyDockerHub}"
				}
   				sh 'sudo docker push limbrit/my-app001:0.0.1'
			}
			stage('Running Docker on Local'){
				sh 'sudo docker run -p 8095:8095 -d limbrit/my-app001:0.0.1'
			}
            archiveArtifacts 'target/*.jar'
        }
        notify('Success')
    } catch (err) {
        notify("Error ${err}")
        currentBuild.result = 'FAILURE'
    }   
}
def notify(status){
    emailext (
      to: "limbritjava@gmail.com",
      subject: "${status}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
      body: """<p>${status}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
        <p>Check console output at <a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a></p>""",
    )
}
