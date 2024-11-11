#!/bin/bash
# Package the current client branch.

if [ -z "$JAVA_CLIENT" ]
then
  echo JAVA_CLIENT must be set to run this script.
  exit 1
fi

if [ $# -lt 2 ]
then
  echo "Usage: $0 <version> jdk8|jdk21 [<ext>]"
  exit
fi

ver=$1
jdk=$2
ext=$3

set -e

origin=`dirname $0`
cd $origin

srcjar=aerospike-client-$jdk-$ver
trgjar=aerospike-client$ext-$jdk-$ver

pkg=`pwd`

rm -rf aerospike-client-*

cd $JAVA_CLIENT

cp client/target/$srcjar.jar $pkg/$trgjar.jar
cp client/target/$srcjar-jar-with-dependencies.jar $pkg/$trgjar-jar-with-dependencies.jar
cp client/target/$srcjar-sources.jar $pkg/$trgjar-sources.jar
cp client/target/$srcjar-javadoc.jar $pkg/$trgjar-javadoc.jar
