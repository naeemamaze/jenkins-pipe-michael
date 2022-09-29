pipeline {
    agent  { label 'OPENJDK-11-MAVEN' }
    parameters {
        choice(name: 'BRANCH_TO_BUILD', choices: ['REL_INT_1.0', 'main'], description: 'Branch to build')
        string(name: 'MAVEN_GOAL', defaultValue: 'package', description: 'maven goal')
    }
    triggers {
        
        pollSCM('* * * * *')
    }
    stages {
        stage('vcs') {
            steps {
                mail subject: 'Build Started', 
                  body: 'Build Started', 
                  to: 'qtdevops@gmail.com' 
                git branch: "${params.BRANCH_TO_BUILD}", url: 'https://github.com/GitPracticeRepo/spring-petclinic.git'
            }


    
        
          
    

        
    
    @@ -21,10 +24,22 @@ pipeline {
  
        }
        stage('build') {
            steps {
                sh "/opt/apache-maven-3.8.6/bin/mvn ${params.MAVEN_GOAL}"
            }
        }

    }
    post {
        always {
            echo 'Job completed'
            mail subject: 'Build Completed', 
                  body: 'Build Completed', 
                  to: 'qtdevops@gmail.com'
        }
        failure {
            mail subject: 'Build Failed', 
                  body: 'Build Failed', 
                  to: 'qtdevops@gmail.com' 
        }
        success {
            junit '**/surefire-reports/*.xml'
        }
    }


    
          
            
    

          
    
    
  
}
