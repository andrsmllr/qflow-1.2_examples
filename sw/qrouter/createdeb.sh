#!/bin/bash

PACKAGENAME=qrouter
VERSION=1.2.31
rm -rf createdeb/
mkdir createdeb
rm -rf createdeb/$PACKAGENAME-$VERSION
#mkdir createdeb/$PACKAGENAME-$VERSION
#git archive master | tar -x -C createdeb/$PACKAGENAME-$VERSION
cd createdeb
wget http://opencircuitdesign.com/qrouter/archive/qrouter-1.2.31.tgz
tar -xvf qrouter-1.2.31.tgz
tar -czvf $PACKAGENAME\_$VERSION.orig.tar.gz $PACKAGENAME-$VERSION
#tar -xvf $PACKAGENAME\_$VERSION.orig.tar.gz
cp -r -v ../debian $PACKAGENAME-$VERSION/
cd $PACKAGENAME-$VERSION
dpkg-buildpackage
#cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
#debuild
