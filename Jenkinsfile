pipeline { 
    agent{ "none" }
    stages{
        stage ('Code Download From SCM'){
            steps{
                git 'https://github.com/praveen1git/demo-hello.git'
                stash name: 'Dockerfile', includes: 'Dockerfile'
            }
        }
        stage('GOF Docker Run'){
            agent{ label "any" }
            steps{
                dir('/home/jenkins'){
                      unstash name: 'Dockerfile'                                                                                           
                }   
                sh '''
                   docker image build -t hairavi10/gameoflife:05.20 /home/jenkins
                   docker run -d -p 8081:8080 hairavi10/gameoflife:05.20
                   '''
            }
        }
        
    }
}
