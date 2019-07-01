#!/usr/bin/env sh
VER='4.0.0.1744'
DIR=~/Downloads
MIRROR=https://binaries.sonarsource.com/Distribution/sonar-scanner-cli

dl()
{
    OS=$1
    FILE=sonar-scanner-cli-${VER}-${OS}.zip
    URL=$MIRROR/$FILE
    LFILE=$DIR/$FILE

    if [ ! -e $LFILE ];
    then
        wget -q -O $LFILE $URL
    fi

    printf "    # %s\n" $URL
    printf "    %s: sha256:%s\n" $OS `sha256sum $LFILE | awk '{print $1}'`
}

printf "  '%s':\n" $VER
dl linux
dl macosx
dl windows


