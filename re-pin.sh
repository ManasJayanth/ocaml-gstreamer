#! /bin/bash

if [[ -z $LDFLAGS ]]
then
    echo "Cerbero flags not found in env. Exiting..."
    exit -1
fi

LIB=gi-gstreamer
opam remove $LIB -y
opam pin remove $LIB -y
opam pin add . -y                                                                                                                                                                                                                                                               
