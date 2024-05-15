
pipeline{
    agent any
    environment {
      MY_VARIABLE = 'Hello, world!'
    }

    parameters {
        // Define parameters
        string(name: 'USERNAME', defaultValue: '', description: 'Enter your username')
    }

    stages{

                stage('parameter') {

                    steps {
                        // Use parameters in the pipeline
                        echo "Username: ${params.USERNAME}"
                        }

                }

                stage('init'){
                    steps{
                        echo 'init stage'
                    }
                    post {
                        always {
                            echo "This block always runs after this stage."
                        }
                    }
                }
                   
                stage('pipline 2') {
                    steps {
                        echo "Value of MY_VARIABLE: ${env.MY_VARIABLE}"
                        error 'error will happen'
                        }
                    post {
                        failure {
                            build '2nd-free-style'
                        }
                    }
                }
        
                stage('push'){
                    steps{
                        echo 'puch stage'
                        }
                    
                }
        
                stage('deploy'){
                    steps{
                        echo 'deploy stage'
                        }
                    
                }
            
    }
}
