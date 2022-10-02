915resolution
=============

This software changes the resolution of an available vbios mode.

It patches only the RAM version of the video bios so the new resolution
is loose each time you reboot. If you want to set the resolution each
time you reboot and before to launch X, use your rc.local, local.start ...
file of your Linux version.

915resolution supports the 845G, 855GM, 865G, 915G, 915GM, 945G, and 945GM chipsets.


Usage
-----

You must be root to launch it.

  Usage: 915resolution [-l] [mode X Y] [bits/pixel]
  Options:
      -l display the modes found into the vbios

  Note that bits per pixel is optional.  If you do specify anything,
  then the original value will be preserved.


Installing
----------

$ make
$ su
# make install

Setting
-------

    1.  Switch to root
       # su

    2. Display the available resolutions :

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

    3. I personnaly decided to overwrite the 1280x1024 resolution
       because I don't use it :

        # 915resolution 38 1280 800

    4. Now the bios reports a 1280x800 resolution :

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

    5.  On some machines 24 bits per pixel is the desired resolution.  
        An alternate invocation to achieve this would be:

        # 915resolution 38 1280 800 24

    6. My xorg.conf has the following screen definition :

        Section "Screen"
          Identifier  "Screen 1"
          Device      "device"
          Monitor     "LCD"
          DefaultDepth 16

          Subsection "Display"
            Depth       16
            Modes       "1280x800"
          EndSubsection
        EndSection

    7. 915resolution must run before the X server is started.  So I don't need to
         do this every time I put it in my startup scripts.  Where these scripts 
         are very from distribution to distribution.  I'm running SUSE 9.2, so I 
         put the definition in /etc/init.d/boot.local:

        #! /bin/sh
        #
        # Copyright (c) 2002 SuSE Linux AG Nuernberg, Germany.  All rights reserved.
        #
        # Author: Werner Fink <werner@suse.de>, 1996
        #         Burchard Steinbild, 1996
        #
        # /etc/init.d/boot.local
        #
        # script with local commands to be executed from init on system startup
        #
        # Here you should add things, that should happen directly after booting
        # before we're going to the first run level.
        #

        /usr/bin/915resolution 38 1280 800        
       
     8.  Start up the X server
        # startx


Disclaimer
----------

915resolution is free to use, distribute or modify. But please mention
my name and the names of the respective contributors.
I tried to make the programs as safe as possible but obviously I can't
guarantee that they'll work for you. So don't blame me if something bad
happens.

                                          Steve Tomljenovic
                                          stomljen at yahoo dot com
