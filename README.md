915resolution
=============

A tool to modify the video BIOS of 800 and 900 series Intel graphics chipsets 


Notes
-----

915resolution supports the 845G, 855GM, 865G, 915G, 915GM, 945G, and 945GM chipsets.

915resolution must run before the X server is started.

915resolution only patches the RAM of the video BIOS, so the new resolution
is lost at each reboot. To automate the modification process, please consult your distribution's
documentation.

915resolution requires root privileges.


Usage
-----

  Usage: 915resolution [-l] [mode X Y] [bits/pixel]
  Options:
      -l display the modes found in the video BIOS

  Note that bits per pixel is optional. If nothing is specified,
  then the original value will be preserved.


Installation
------------

$ make
$ su
# make install


Example
-------

    1. Display the available resolutions :

        # 915resolution -l
        Intel 800/900 Series VBIOS Hack : version 0.5.3

        Chipset: 915GM
        BIOS: TYPE 1
        Mode Table Offset: $C0000 + $269
        Mode Table Entries: 36
        Mode Table Offset: $C0000 + $269
        Mode Table Entries: 36

        Mode 30 : 640x480, 8 bits/pixel
        Mode 32 : 800x600, 8 bits/pixel
        Mode 34 : 1024x768, 8 bits/pixel
        Mode 38 : 1280x1024, 8 bits/pixel
        Mode 3a : 1600x1200, 8 bits/pixel
        Mode 3c : 1920x1440, 8 bits/pixel
        Mode 41 : 640x480, 16 bits/pixel
        Mode 43 : 800x600, 16 bits/pixel
        Mode 45 : 1024x768, 16 bits/pixel
        Mode 49 : 1280x1024, 16 bits/pixel
        Mode 4b : 1600x1200, 16 bits/pixel
        Mode 4d : 1920x1440, 16 bits/pixel
        Mode 50 : 640x480, 32 bits/pixel
        Mode 52 : 800x600, 32 bits/pixel
        Mode 54 : 1024x768, 32 bits/pixel
        Mode 58 : 1280x1024, 32 bits/pixel
        Mode 5a : 1600x1200, 32 bits/pixel
        Mode 5c : 1920x1440, 32 bits/pixel
        Mode 60 : 1280x770, 8 bits/pixel
        Mode 61 : 1280x770, 16 bits/pixel
        Mode 62 : 1280x770, 32 bits/pixel
        Mode 63 : 512x771, 8 bits/pixel
        Mode 64 : 512x771, 16 bits/pixel
        Mode 65 : 512x771, 32 bits/pixel

    2. Consider the example of overwriting Mode 38 :

        # 915resolution 38 1280 800

    3. Now the BIOS reports a 1280x800 resolution :

        # 915resolution -l
        Intel 800/900 Series VBIOS Hack : version 0.5.2

        Chipset: 915GM
        BIOS: TYPE 1
        Mode Table Offset: $C0000 + $269
        Mode Table Entries: 36
        Mode Table Offset: $C0000 + $269
        Mode Table Entries: 36

        Mode 30 : 640x480, 8 bits/pixel
        Mode 32 : 800x600, 8 bits/pixel
        Mode 34 : 1024x768, 8 bits/pixel
        Mode 38 : 1280x800, 8 bits/pixel
        Mode 3a : 1600x1200, 8 bits/pixel
        Mode 3c : 1920x1440, 8 bits/pixel
        Mode 41 : 640x480, 16 bits/pixel
        Mode 43 : 800x600, 16 bits/pixel
        Mode 45 : 1024x768, 16 bits/pixel
        Mode 49 : 1280x800, 16 bits/pixel
        Mode 4b : 1600x1200, 16 bits/pixel
        Mode 4d : 1920x1440, 16 bits/pixel
        Mode 50 : 640x480, 32 bits/pixel
        Mode 52 : 800x600, 32 bits/pixel
        Mode 54 : 1024x768, 32 bits/pixel
        Mode 58 : 1280x800, 32 bits/pixel
        Mode 5a : 1600x1200, 32 bits/pixel
        Mode 5c : 1920x1440, 32 bits/pixel
        Mode 60 : 1280x770, 8 bits/pixel
        Mode 61 : 1280x770, 16 bits/pixel
        Mode 62 : 1280x770, 32 bits/pixel
        Mode 63 : 512x771, 8 bits/pixel
        Mode 64 : 512x771, 16 bits/pixel
        Mode 65 : 512x771, 32 bits/pixel

    4.  On some machines 24 bits per pixel is desired.
        An invocation to achieve this is:

        # 915resolution 38 1280 800 24

    6. Start the X server
        # startx


Chipset information
-------------------

|            CHIPSET           |     ID     |    PAM    |
|:----------------------------:|:----------:|:---------:|
| 845G, 845GL, 845GV           | $2560_8086 | $91 - $92 |
| 865G, 865GV                  | $2570_8086 | $91 - $92 |
| 855GM, 855GME, 852GM, 852GMV | $3580_8086 | $5A - $5b |
| 915G                         | $2580_8086 | $91 - $92 |
| 915PM, 915GM, 915GMS, 910GML | $2590_8086 | $91 - $92 |
|             945G             | $2770_8086 | $91 - $92 |
|            945GM             | $27A0_8086 | $91 - $92 |


Provenance disclaimer
---------------------

This program incorporated public domain work originally written by Steve Tomljenovic, which was itself based on techniques in the work of Christian Zietz, Andrew Tipton, and Alain Poirier.

More thorough information can be found on Steve Tomljenovic's website, which is archived [here](https://web.archive.org/web/20100610094322/http://915resolution.mango-lang.org:80/).
