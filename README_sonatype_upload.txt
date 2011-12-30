
This information is mostly relevant only for the very few people 
helping to maintain the Sonatype repository, although others
may benefit tangentially from knowinig "how we do it".
	
---------------------------------------------------------------------------------------	
1) Obtain access to the com.jme3 project in the Sonatype repository.
   Contact pflanzenmoerder for details.  General background is here:

https://docs.sonatype.org/display/Repository/Sonatype+OSS+Maven+Repository+Usage+Guide

Once you have those permissions, you can add the following 
server config to your maven installation's settings.xml file.

<server>
	<id>sonatype-nexus-snapshots</id>
	<username>Your Sonatype-JIRA-Username</username>
	<password>Your Sonatype-JIRA-Password</password>
</server>

---------------------------------------------------------------------------------------
2) 	Download latest or "best" JME3 nightly build from:
	
	http://jmonkeyengine.com/nightly/
	
	(If automating this process, add a "direct." to the beginning of the hostname,
	but shhhh, don't tell the robots).
	
---------------------------------------------------------------------------------------
3) Unzip the build.

---------------------------------------------------------------------------------------
4) Create a sources.zip file in the unpacked directory, from the "source" tree 
of the unpacked build.

---------------------------------------------------------------------------------------
5) Copy the file   upload_jme3_to_sonatype.sh  into the unpacked build directory.

---------------------------------------------------------------------------------------
6) Compare the script and the jars in the "lib" directory to see if any jar names
have changed, or any jars have been added or removed.   Make appropriate changes
to the script, and commit those changes back to the github repo after you have
tested them.

If any artifacts have been removed, or their names have changed, then you should
manually clear out the Sonatype snapshot repository through their GUI, so that
we don't have old jars dangling from our snapshot and confusing our users.  

See instructions for that step here:

https://docs.sonatype.org/display/Repository/Sonatype+OSS+Maven+Repository+Usage+Guide#SonatypeOSSMavenRepositoryUsageGuide-7a.2.PublishSnapshots

---------------------------------------------------------------------------------------
7)   Run		upload_jme3_to_sonatype.sh  

	A) Script expects current directory to contain 
		
		1) The jars from an unzipped JME3 nightly build, in particular:
		
			jMonkeyEngine3.jar (launchable demo/test code)
			
			lib/jME3-core.jar, ...  (all JME3 libs)
		
			"opt" libs are presently ignored (android, native-bullet), but
				may be added later.
		
		2) A file called "sources.zip", which for the moment is presumably
			best built by zipping up the entire "source" tree of the unpacked
			JME3 build.
			
	B) Script is configured by just 4 shell variables 
	
	GROUPID=com.jme3
	DEPLOYVERSION=3.0.0-SNAPSHOT
	SONAURL=https://oss.sonatype.org/content/repositories/snapshots/
	CMD='mvn deploy:deploy-file -Durl='$SONAURL' -DrepositoryId=sonatype-nexus-snapshots -DgroupId='$GROUPID' -Dpackaging=jar -Dversion='$DEPLOYVERSION

	#Note the gnarly quoting in CMD variable  
	#TODO:  Try "double quotes", also figure out why we can't wrap this value and echo in shell func.
	
	C) Script uses exact jar names from nightly build as the artifactID everywhere,
	EXCEPT 
		i) Nightly build jar name contains version information:  
				noise-0.0.1-SNAPSHOT.jar ->  artifactId= noise
				
		ii) Demo jar jMonkeyEngine3 has lower-case artifactID=jmonkeyengine3
		
8) Update these README files and all demo + archetype files, and commit these
changes as well as any script changes to github.

/*
 * Copyright (c) 2011 jme3-maven
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 * * Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the distribution.
 *
 * * Neither the name of 'jme3-maven' nor the names of its contributors
 *   may be used to endorse or promote products derived from this software
 *   without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */		