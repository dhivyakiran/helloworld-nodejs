node {
	git url: 'https://github.com/dhivyakiran/helloworld-nodejs.git'
	mydatas = readYaml file: "sample.yml"
}

pipeline {
	agent
                {
                    
		dockerfile true
                            
                }

     	stages 
	{
	  stage('Read YML file from current repository') {
	      steps 
		{
	          script 
		    {
			  
			    echo "Build url:${currentBuild.absoluteUrl}"
			
                     }
			
	         }
		}
	    stage('Download Dependencies')
               {
		when {expression{mydatas.pipeline != "Deploy" }}
		 steps {
			nodejs(nodeJSInstallationName: 'NodeJS')
			 {
    			sh 'npm install'
			 }
		      }
                }
	  		
	  }
	post {
	  always {
		  mail to: 'dhivya.k@cognizant.com',
		  subject: "${currentBuild.result} pipeline: ${currentBuild.fullDisplayName}",
		  body: "${currentBuild.absoluteUrl} has result ${currentBuild.result}"

	        }
	  
  }
}
	
	

