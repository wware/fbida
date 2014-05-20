Using fbi for 3d printing
=========================

This will involve a Raspberry Pi board directly driving a DLP pico projector to
expose UV-curable resin.  Most of the time you want a black screen.  Then you
expose areas of white for a fixed number of seconds, and you go back to black.

Do not use `apt-get install` to install `fbi` on your RPi.  Use this version
because it will have a special tweak.  The tweak is the addition of a "-S"
command line option which suppresses the status line.  Build it like this.

```bash
sudo apt-get install libexif-dev libjpeg8-dev libfontconfig1-dev
sudo ln -s /usr/include/freetype2/freetype /usr/include/freetype
make
sudo make install
```

A few notes on performance.  If you have a relatively small PNG file, then the
image comes up nearly immediately.  I think small PNGs are the way to get a
reliable UV exposure time.  If I start designing 3D parts so intricate that
the PNGs get large, I'll need to rethink that strategy.

These are the kinds of commands that appear to work for this.

```bash
#!/bin/bash
sudo ./fbi -S -1 -T 1 -d /dev/fb0 kitten.png
sleep 5
sudo ./fbi -S -1 -T 1 -d /dev/fb0 black.png
sudo killall fbi         # because it leaves processes lying around
```

It might be a good idea to adjust the argument of the `sleep` command based on
the size and/or complexity of the PNG file.  Probably just the size: because
PNG is a compression scheme, size and complexity are probably closely related
in some Kolomogorv-ish way.  I expect that my early stuff will not be so
complex, so that can wait for later.

what is it?
===========

Ida is a small and fast image viewer, motif-based.  For people who
don't want the KDE/GNOME overhead.  Some basic editing functions are
available too.


build
=====

Check the INSTALL file for detailed build instructions.

ida uses Motif 2.x features (utm, render tables).  This means you need
openmotif, lesstif does *not* cut it.

It also uses the usual graphics libraries (libtiff, libpng, libjpeg,
...), you should have them installed to get support for these image
formats.


usage
=====

There is a manual page, check it out.


what "ida" stands for?
======================

It is just a name.  The utility used to be named "iv" for "Image
Viewer", but that gave lots of name clashes.  Its very likely that
people name such a tool "iv", it is also used as shortcut for
InterViews (remember Sun's Open Windows?).  So i decided to rename it.

I looked for a short name starting with 'i' in a list for children
first names.  I like "ida", so I picked this one.  It is a old, german
name.


Have fun,

  Gerd

-- 
Gerd Hoffmann <gerd@kraxel.org>
