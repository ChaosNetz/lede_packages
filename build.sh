#!/bin/bash


SUFFIX='.tar.xz'

if [ -z $LEDE_RELEASE ];then
 LEDE_RELEASE='17.01.1'
fi 

if [ -z $ARCH ];then
  ARCH='ar71xx'
fi

if [ -z $SDK ];then 
  SDK="lede-sdk-$LEDE_RELEASE-$ARCH-generic_gcc-5.4.0_musl-1.1.16.Linux-x86_64"
fi

if [ -z $SDK_URL ]; then
  SDK_URL="https://downloads.lede-project.org/releases/$LEDE_RELASE/targets/$ARCH/generic/$SDK$SUFFIX"
fi

if [ -z $PKGS ]; then
  PKGS=$(ls packages)
fi

BUILD_KEY=''
if ! [ -z $CONFIG_BUILD_KEY ]; then
  BUILD_KEY="BUILD_KEY=$CONFIG_BUILD_KEY"
fi

IFS=' '



## Setting up the build environment
if ! [ -f "$SDK$SUFFIX" ]
then 
  wget  "$SDK_URL" 
fi

if ! [ -d "$SDK" ]
then
 tar -xf $SDK$SUFFIX
fi


pwd=$(pwd)
#Linking packages
for pkg in $PKGS; do
  echo "Including Packet $pkg"
  ln -fs $pwd/packages/$pkg ./$SDK/package/$file/$pkg  
done

make -C $SDK defconfig
make -C $SDK V=99 $BUILD_KEY world
