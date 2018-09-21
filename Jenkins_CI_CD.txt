node {
    stage('Downloading') {
    git 'https://github.com/Dhamodharanraju/springBoot.git'
    }
    
    dir('spring-boot-samples/spring-boot-sample-atmosphere/') {
        stage('Clean') {
        sh 'mvn clean compile test package'
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
        archiveArtifacts 'target/*.jar'
    }
}
