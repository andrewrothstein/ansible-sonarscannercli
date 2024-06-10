#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://binaries.sonarsource.com/Distribution/sonar-scanner-cli

dl () {
    local key=$1
    local file=$2
    local url=$MIRROR/$file
    local lfile=$DIR/$file

    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $key $(sha256sum $lfile | awk '{print $1}')
}

dl_os () {
    local ver=$1
    local os=$2
    local file=sonar-scanner-cli-${ver}-${os}.zip
    dl $os $file
}

dl_ver() {
    local ver=$1
    printf "  '%s':\n" $ver
    dl javaless sonar-scanner-cli-${ver}.zip
    dl_os $ver linux
    dl_os $ver macosx
    dl_os $ver windows
}

dl_ver ${1:-6.0.0.4432}
