GROUPID=com.jme3
DEPLOYVERSION=3.0.0-SNAPSHOT
SONAURL=https://oss.sonatype.org/content/repositories/snapshots/
CMD='mvn deploy:deploy-file -Durl='$SONAURL' -DrepositoryId=sonatype-nexus-snapshots -DgroupId='$GROUPID' -Dpackaging=jar -Dversion='$DEPLOYVERSION 

#Note the gnarly interrupted quoting in CMD variable  
#TODO:  Try "double quotes", also figure out why we can't wrap this value and echo in shell func.

deploy( ) {
$CMD -DartifactId=$1 -Dfile=$2 
}

deploy_with_source( ) {
$CMD -DartifactId=$1 -Dfile=$2 -Dsource=$3 
}

deploy_lib ( ) {
$CMD -DartifactId=$1 -Dfile=lib/${1}.jar
}

# Top JMonkey project (as of 2011-12-15) is a launchable jar 
# containing just the demo/test code, which we deploy together 
# with a single arbitrary sourceball: sources.zip
# TODO: Sources will need more treatment before a proper Sonatype 
# "release".

deploy_with_source jmonkeyengine3 jMonkeyEngine3.jar sources.zip


# JME3 core code
deploy_lib jME3-core

# LWJGL related
deploy_lib jME3-lwjgl
deploy_lib jME3-lwjgl-natives
deploy_lib lwjgl

# Bullet physics related
deploy_lib jME3-jbullet
deploy_lib jbullet

# Other JME3 feature libs, excluding TestData + Nifty
deploy_lib jME3-blender
deploy_lib jME3-desktop
deploy_lib jME3-plugins
deploy_lib jME3-terrain

# Wrapped 3rd party libraries - some of these are already in Maven Central - 
# TODO: evisit and prune this list down before "release" to Sonatype.
deploy_lib jinput
deploy_lib eventbus
deploy_lib stack-alloc
deploy_lib vecmath

# Other 3rd party libraries, which are currently shipped by JME3 team with a version
# stamp embedded in the name, which we strip off in the renaming.  xmlpull should
# probably be xmpullxpp, but we went with shorter name to match jars already delivered
# to Sonatype with earlier versions of deploy.sh.
# TODO: Replace with proper 3rd party deps before "release" to Sonatype.
deploy xmlpull 	lib/xmlpullxpp3.jar
deploy noise 	lib/noise-0.0.1-SNAPSHOT.jar

# Large library of test data
deploy_lib jME3-testdata

# Ogg sound stuff
deploy_lib jME3-jogg
deploy_lib j-ogg-oggd
deploy_lib j-ogg-vorbisd

# Nifty GUI
deploy_lib jME3-niftygui
deploy_lib nifty
deploy_lib nifty-default-controls
deploy_lib nifty-examples
deploy_lib nifty-style-black

# /*
# * Copyright (c) 2011 jme3-maven
# * All rights reserved.
# *
# * Redistribution and use in source and binary forms, with or without
# * modification, are permitted provided that the following conditions are
# * met:
# *
# * * Redistributions of source code must retain the above copyright
# *   notice, this list of conditions and the following disclaimer.
# *
# * * Redistributions in binary form must reproduce the above copyright
# *   notice, this list of conditions and the following disclaimer in the
# *   documentation and/or other materials provided with the distribution.
# *
# * * Neither the name of 'jme3-maven' nor the names of its contributors
# *   may be used to endorse or promote products derived from this software
# *   without specific prior written permission.
# *
# * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
# * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# */
