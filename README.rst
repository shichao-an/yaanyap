yaanyap
=======

yaanyap (Yet Another Anyap) is a command-line script to batch download online videos and extract audio to MP3. It is named after "anyap" because of the termination of its site `nicosound.anyap.info <http://nicosound.anyap.info/>`_.

Requirements
------------

* `get-flash-videos <https://code.google.com/p/get-flash-videos/>`_
* `ffmpeg <http://www.ffmpeg.org/>`_

Installation
------------
Install requirements before running this script. You have to install ``get_flash_videos`` commands to binary path (e.g. /usr/local/bin) as yaanyap is based on this command. You can use the install.sh helper script to install relevant packages and install ``get_flash_video`` to /usr/local/bin.

Download yaanyap or clone it::

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
