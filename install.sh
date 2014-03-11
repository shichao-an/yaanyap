#!/bin/bash

# Make sure you are root when running this script
set -o errexit
usage="Usage: ./install.sh [yum|apt-get] cpan git [yaanyap]"
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
    elif [ "$1" = "git" ]
    then
        which git &> /dev/null || { echo "No command named 'git' found"; exit 1; }
        git clone https://github.com/monsieurvideo/get-flash-videos.git
        ln -s $(realpath get-flash-videos/get_flash_videos) \
            /usr/local/bin/get_flash_videos
        shift
    elif [ "$1" = "yaanyap" ]
    then
        yaanyap_dir=$(dirname "$0")
        if [ ! -f "$yaanyap_dir/yaanyap" ]
        then
            git clone https://github.com/shichao-an/yaanyap 
            yaanyap_dir="yaanyap"
        fi
        ln -s $(realpath "$yaanyap_dir/yaanyap") /usr/local/bin/yaanyap
        shift

    else
        echo "$usage" >&2
        exit 1
    fi
done
