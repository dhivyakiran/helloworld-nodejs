node {
	mydatas = readYaml file: "sample.yml"
}

pipeline {
	agent
                {
                    
		label 'master'
                            
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
		 agent {
                docker { image 'node:7-alpine' }
            }
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
	
	

