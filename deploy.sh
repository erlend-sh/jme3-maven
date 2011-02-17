GROUPID=com.jme3
DEPLOYVERSION=3.0.0-SNAPSHOT
VERSION=3.0.$(date -v -2d +%Y-%m-%d)
FILENAME=jME3_$(date -v -2d +%m-%d-%Y).zip
URL=http://jmonkeyengine.com/nightly/$FILENAME
SONAURL=https://oss.sonatype.org/content/repositories/snapshots/
URI=$VERSION/$FILENAME
CMD='mvn deploy:deploy-file -Durl='$SONAURL' -DrepositoryId=jme3-sonatype -DartifactId=jmonkeyengine3 -DgroupId='$GROUPID' -Dpackaging=jar -Dversion='$DEPLOYVERSION 

deploy( ) {
$CMD -DartifactId=$1 -Dfile=$2 
}

deploy_with_source( ) {
$CMD -DartifactId=$1 -Dfile=$2 -Dsource=$3 
}

#create dir for new version, download and unzip
mkdir $VERSION
curl $URL > $URI
cd $VERSION
unzip $FILENAME

#deploy downloaded jars
deploy_with_source jmonkeyengine3 jMonkeyEngine3.jar sources.zip
deploy lwjgl lib/lwjgl.jar
deploy lwjgl-natives lib/jME3-lwjgl-natives.jar
deploy oggd lib/j-ogg-oggd.jar
deploy jme3testdata lib/jme3testdata.jar
deploy jbullet lib/jbullet.jar
deploy stack-alloc lib/stack-alloc.jar
deploy vecmath lib/vecmath.jar
deploy vorbisd lib/j-ogg-vorbisd.jar
deploy gluegen-rt lib/gluegen-rt.jar
deploy jinput lib/jinput.jar
deploy nifty-examples lib/nifty-examples-1.2_small.jar
deploy jme3test lib/jme3test.jar
deploy nifty-style-black lib/nifty-style-black-1.2-SNAPSHOT.jar
deploy jogl-natives lib/jME3-jogl-natives.jar
deploy jogl lib/jogl.jar				
deploy xmlpull lib/xmlpull-xpp3-1.1.4c.jar
deploy nifty lib/nifty-1.2-SNAPSHOT.jar
deploy jheora-debug lib/jheora-debug-0.6.0.jar
deploy nifty-default-controls lib/nifty-default-controls-1.2-SNAPSHOT.jar

