
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

                stages('parameter') {

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





    parameters {
        // Define parameters
        string(name: 'USERNAME', defaultValue: '', description: 'Enter your username')
        booleanParam(name: 'ENABLE_TESTS', defaultValue: true, description: 'Enable tests')
        choice(name: 'BUILD_TYPE', choices: ['Debug', 'Release'], description: 'Choose build type')
        password(name: 'PASSWORD', defaultValue: '', description: 'Enter your password')
    }

    stages {
        stage('Example Stage') {
            steps {
                // Use parameters in the pipeline
                echo "Username: ${params.USERNAME}"
                echo "Enable tests: ${params.ENABLE_TESTS}"
                echo "Build type: ${params.BUILD_TYPE}"
                echo "Password: ${params.PASSWORD}"
            }
        }
    }
