#!/bin/sh -e

VERSION=$2
TAR=../plexus-i18n_$VERSION.orig.tar.gz
DIR=plexus-i18n-$VERSION
TAG=$(echo "plexus-i18n-$VERSION" | sed -re's/~(alpha|beta)/-\1-/')

svn export http://svn.codehaus.org/plexus/plexus-components/tags/${TAG}/ $DIR
GZIP=--best tar -c -z -f $TAR --exclude '*.jar' --exclude '*.class' $DIR
rm -rf $DIR ../$TAG
