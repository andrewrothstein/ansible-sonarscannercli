#!/usr/bin/env sh
VER='4.0.0.1744'
DIR=~/Downloads
MIRROR=https://binaries.sonarsource.com/Distribution/sonar-scanner-cli

dl () {
    local key=$1
    local file=$2
    local url=$MIRROR/$file
    local lfile=$DIR/$file

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $key `sha256sum $lfile | awk '{print $1}'`
}

dl_os () {
    local os=$1
    local file=sonar-scanner-cli-${VER}-${os}.zip
    dl $os $file
}

printf "  '%s':\n" $VER
dl javaless sonar-scanner-cli-${VER}.zip
dl_os linux
dl_os macosx
dl_os windows


