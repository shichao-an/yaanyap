#!/bin/bash


# usage: ./install.sh yum cpan git
# Install dependencies and make symbolic links from the Git repository
while (( "$#" ))
do
    if [ "$1" = "yum" ]
    then
        yum -y install perl-libxml-perl perl-WWW-Mechanize \
            perl-Compress-Raw-Zlib perl-Crypt-Rijndael ffmpeg
        shift
    elif [ "$1" = "cpan" ]
    then
        cpan install local::lib WWW::Mechanize Module::Find LWP::Protocol::https
        shift
    elif [ "$1" = "git" ]
    then
        git clone https://github.com/monsieurvideo/get-flash-videos.git
        ln -s $(realpath get-flash-videos/get_flash_videos) \
            /usr/local/bin/get_flash_videos
        shift
    fi
done
