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
                   
                stage('Example Stage') {
                    steps {
                        echo "Value of MY_VARIABLE: ${env.MY_VARIABLE}"
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
