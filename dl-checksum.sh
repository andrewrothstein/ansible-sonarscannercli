#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://binaries.sonarsource.com/Distribution/sonar-scanner-cli

# https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-6.2.1.4610-linux-x64.zip
# https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-6.2.1.4610-linux-aarch64.zip
# https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-6.2.1.4610-macosx-x64.zip
# https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-6.2.1.4610-macosx-aarch64.zip
# https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-6.2.1.4610-windows-x64.zip
# https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-6.2.1.4610.zip

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
    local arch=$3
    local platform="${os}-${arch}"
    local file="sonar-scanner-cli-${ver}-${platform}.zip"
    dl $platform $file
}

dl_ver() {
    local ver=$1
    printf "  '%s':\n" $ver
    dl javaless sonar-scanner-cli-${ver}.zip
    dl_os $ver linux x64
    dl_os $ver linux aarch64
    dl_os $ver macosx x64
    dl_os $ver macosx aarch64
    dl_os $ver windows x64
}

dl_ver ${1:-7.0.2.4839}
