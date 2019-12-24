node {
	
	mydatas = readYaml file: "sample.yml"
}

pipeline {
	agent
                {
                    
		label "${mydatas.agentdetail.agentname}"
                            
                }

     	stages 
	{
	stage('Read YML file from another repository') {
	      steps 
		{
	          script 
		    {
			  git url: 'https://github.com/dhivyakiran/angular-yml.git'
			  testdatas = readYaml file: "test.yml"
			  echo testdatas.test.message
			
                     }
			
	         }
		}	
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

	    stage('Zip the app')
	    {
		when {expression{mydatas.pipeline != "Deploy" }}    
		steps 
		{
	            script
		      {
			zip archive: true, dir: './src', glob: '', zipFile: mydatas.zipfile.filename+"_${currentBuild.number}.zip"
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
	
	

