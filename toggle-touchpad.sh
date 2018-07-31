#!/bin/bash
# can be used standalone.
# created for use with i3 window manager

# TODO: giving error
# sagi xserver-xorg-input-synaptics
# $ sudo synclient TouchpadOff=1
#   Couldn't find synaptics properties. No synaptics driver loaded?

if synclient -l | grep "TouchpadOff .*=.*0" ; then
    synclient TouchpadOff=1 ;
else
    synclient TouchpadOff=0 ;
fi
