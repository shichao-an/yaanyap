yaanyap
=======

yaanyap (Yet Another Anyap) is a command-line script to batch download online videos and extract audio to MP3. It is named after "anyap" because of the termination of its site `nicosound.anyap.info <http://nicosound.anyap.info/>`_. This script is based on `get-flash-videos <https://code.google.com/p/get-flash-videos/>`_ . However, get-flash-videos's Nicovideo support was broken as you can `see here <https://code.google.com/p/get-flash-videos/wiki/BrokenSites>`_, which makes the name of this project rather irrelevant. You can still find videos from the `working sites <https://code.google.com/p/get-flash-videos/wiki/WorkingSites>`_.

Requirements
------------

* `get-flash-videos <https://code.google.com/p/get-flash-videos/>`_
* `ffmpeg <http://www.ffmpeg.org/>`_

Installation
------------
Install requirements before running this script. You have to install ``get_flash_videos`` commands to binary path (e.g. /usr/local/bin) as yaanyap is based on this command.

You can use the install.sh helper script to install relevant packages and make symbolic links of ``get_flash_video`` and ``yaanyap`` to /usr/local/bin::

    $ wget https://raw.github.com/shichao-an/yaanyap/master/install.sh

On Debian/Ubuntu::

    $ sudo ./install.sh apt-get cpan
    $ sudo ./install.sh gfv yaanyap

On Fedora::

    $ sudo ./install.sh yum cpan
    $ sudo ./install gfv yaanyap


Manually, you can download yaanyap or clone it and make your own scripts::

    $ git clone https://github.com/shichao-an/yaanyap.git

Usage
-----
::

    $ ./yaanyap [-f FILENAME] [-b BITRATE] [-o DIRECTORY] [URL...]

If bitrate is not specified, it will prompt for it. ``FILENAME`` and ``URL`` can both appear; the script will download and convert all the relevant URLs.

Example
-------
Specify URLs as arguments::

    $ ./yaanyap http://www.example.com/video/123 http://www.example.com/video/456


Specify a file containing a list of URLs and bitrate for all videos::

    $ ./yaanyap -f testfile -b 192
