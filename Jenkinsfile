node 
{
   git url: 'https://github.com/dhivyakiran/helloworld-nodejs.git'
   mydatas = readYaml file: "app.yml"
}
pipeline 
{
  agent
  {
    label 'master'
  }
stages 
{
  stage('Source code checkout') 
  {
    steps 
    {
       script 
       {
	 git url: 'https://github.com/dhivyakiran/nodejs1.git'
	 appdata = readYaml file: "app.yml"
       }
     }
   stage('Download Dependencies')
   {
      when {expression{mydatas.pipeline != "Deploy" }}
      steps 
      {
	 nodejs(nodeJSInstallationName: 'NodeJS')
	 {
           sh 'npm install'
	 }
       }
    }
    stage("TS Linting") 
    {
        when {expression{(pipelinetype != "deploy")}}
        steps 
        {
            echo "Linting"
        }
    }
    stage("Unit Testcase") 
    {
        when {expression{(pipelinetype != "deploy")}}
        steps 
        {
            echo "Execute unit tests"
        }
    }
    /*stage("Sonar Code Coverage") 
    {
        when {expression{(pipelinetype != "deploy")}}
        steps 
        {
            echo "code coverage"
        }
    }
    stage("SonarQube code analysis") 
    {
        when {expression{(pipelinetype != "deploy")}}
          //environment { scannerHome = tool 'SonarQubeScanner' }
        steps {
           //withSonarQubeEnv('sonarqube') { bat "${scannerHome}/bin/sonar-scanner"}
          bat "sonar-scanner -X"
        }
     }
     stage("SonarQube Quality Gate") 
     {
        when {expression{(pipelinetype != "deploy")}}
        steps 
        {
            timeout(time: 10, unit: 'MINUTES') 
            {
               waitForQualityGate abortPipeline: true
            }
        }
     }*/
     stage("Security scan") 
    {
        when {expression{(pipelinetype != "deploy")}}
        steps 
        {
            echo "security scan"
        }
    }
    stage('Docker Build') 
    {
       steps 
       {
	 sh 'docker build -t hellonodejs1:latest .'
       }
    }
  }
}
post 
   {
      always 
      {
         emailext attachLog: true, body: "${currentBuild.result}: ${currentBuild.absoluteUrl}", compressLog: true, replyTo: 'dhivya.krish15@gmail.com', subject: "${currentBuild.result} pipeline: ${currentBuild.fullDisplayName}", to: 'dhivyakrish1491@gmail.com'
      }
   }

	
