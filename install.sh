#!/bin/bash

# Make sure you are root when running this script
set -o errexit
usage="Usage: ./install.sh [yum|apt-get] cpan gfv [yaanyap]"

if [ "$#" -eq 0 ]
then
    echo "$usage" >&2
    exit 1
fi

# Install dependencies and make symbolic links from the Git repository
while (( "$#" ))
do
    if [ "$1" = "yum" ]
    then
        which yum &> /dev/null || { echo "No command named 'yum' found"; exit 1; }
        yum -y install perl-libxml-perl perl-WWW-Mechanize \
            perl-Compress-Raw-Zlib perl-Crypt-Rijndael ffmpeg
        shift
    elif [ "$1" = "apt-get" ]
    then
        which apt-get &> /dev/null || { echo "No command named 'apt-get' found"; exit 1; }
        apt-get -y install apt-get install libwww-mechanize-perl libxml-simple-perl
        shift
    elif [ "$1" = "cpan" ]
    then
        which cpan &> /dev/null || { echo "No command named 'cpan' found"; exit 1; }
        cpan install local::lib WWW::Mechanize Module::Find LWP::Protocol::https
        shift
    elif [ "$1" = "gfv" ]
    then
        echo -n "Specifiy download directory for get-flash-videos (default current): "
        read gfv_path
        eval gfv_path="$gfv_path" # Tilde expansion
        if [ ! -d "$gfv_path" ]
        then
            echo "$gfv_path is not a directory or does not exist" >&2
            exit 1
        fi
        gfv_path=${gfv_path:-$PWD}
        pushd "$PWD"
        which git &> /dev/null || { echo "No command named 'git' found"; exit 1; }
        cd "$gfv_path"
        git clone https://github.com/monsieurvideo/get-flash-videos.git
        echo "get-flash-videos has been cloned to $gfv_path."
        ln -s $(realpath "$gfv_path/get-flash-videos/get_flash_videos") \
            /usr/local/bin/get_flash_videos
        popd
        shift
    elif [ "$1" = "yaanyap" ]
    then
        echo -n "Specifiy download directory for yaanyap (default current): "
        read yaanyap_path
        eval yaanyap_path="$yaanyap_path" # Tilde expansion
        if [ ! -d $yaanyap_path ]
        then
            echo "$yaanyap_path is not a directory or does not exist" >&2
            exit 1
        fi
        yaanyap_path=${yaanyap_path:-$PWD}
        pushd "$PWD"
        which git &> /dev/null || { echo "No command named 'git' found"; exit 1; }
        cd "$yaanyap_path"
        git clone https://github.com/shichao-an/yaanyap 
        echo "yaanyap has been cloned to $yaanyap_path"
        ln -s $(realpath "$yaanyap_path/yaanyap/yaanyap") /usr/local/bin/yaanyap
        popd
        shift
    else
        echo "$usage" >&2
        exit 1
    fi
done
