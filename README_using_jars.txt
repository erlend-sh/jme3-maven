
IMPORTANT:   See copyright and license notes at bottom.

You can see our delivered jars in the sonatype "snapshots" repository at:
	
	https://oss.sonatype.org/content/repositories/snapshots/com/jme3/
	
...which is customarily accessed via the "public" consolidated view at:

	http://oss.sonatype.org/content/repositories/public/com/jme3/
	
The repository contains all the "current" jars recently uploaded by our script
(from nightly build 2011-12-15), as well as some "old" jars leftover from 
previous incarnations.  (TODO:  Clear the snapshots directory through Sonatype GUI).

The "good" artifacts all have names matching the jars contained in the 
current jME3 nightly build, with the exception of one third party jar
that has version information embedded in its name, as delivered by
the JME3 team.  Here is how we have mapped these names into maven artifactIds:

	noise-0.0.1-SNAPSHOT.jar	=>		noise
	
We have also mapped the "main" jmonkey jar name (containing the jME3 test+demo 
code) to all-lower-case, as follows:

	jMonkeyEngine3 				=>		jmonkeyengine3
	
Here is an example project that depends on all these jars, and which launches 
the JME3 TestChooser:

http://subversion.assembla.com/svn/friendularity/trunk/maven/org.friendularity.demo.jme3.maven/

The above project's pom.xml imports *all* the jME3 artifact jars, including all 
test data, which is more than you will probably want in your project. So, you 
will want to copy dependencies from the pom.xml, chopping them down to just what 
you want/need.

To create your own pom.xml file using these jars, you will need to have a 
pointer in your pom.xml to the sonatype "public" repository. 

	<repositories>
		<repository>
			<id>sonatype-public</id>
			<name>sonatype public</name>
			<url>https://oss.sonatype.org/content/groups/public/</url>
		</repository>	  
	</repositories>
	
Then your individual jar dependencies are defined as follows:

	<dependency>
		<groupId>com.jme3</groupId>
		<artifactId>jME3-core</artifactId>
		<version>3.0.0-SNAPSHOT</version>
	</dependency>

For up-to-date information about the contents of each jar, see the jmonkeyengine.org 
website.   (TODO:  Link to most helpful pages on this topic).


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