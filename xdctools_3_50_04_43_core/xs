#!/bin/sh
#
#  xs - XDCscript shell
#
#  usage: xs file
#
#  This script is necessary on Unix hosts *only* because we need to control
#  the LD_LIBRARY_PATH environment variable to ensure that the proper dynamic
#  libraries are found.
#
#  LD_LIBRARY_PATH must be set to a path where libcdb.so can be found (the
#  CDB dll).  This script sets LD_LIBRARY_PATH to:
#
#       `location of xs`:`location of JRE's shared libraries`
#
ROOT="`dirname $0`"

#
# prepare to extend the user's current LD_LIBRARY_PATH.
#
if [ "x$LD_LIBRARY_PATH" != "x" ]; then
   # one already exists, so prepare to add new elements to the front
   _cur=":$LD_LIBRARY_PATH"
else
   # does not already exist, so leave it completely empty
   _cur=""
fi

#
#  set LD_LIBRARY_PATH so that we find libcdb.so and JRE libraries, and
#  set EXE to select the appropriate xs executable.
#
if [ "`/bin/uname`" = "Linux" ]; then
    LD_LIBRARY_PATH="${ROOT}:${ROOT}/jre/lib/amd64/server:${ROOT}/jre/lib/amd64$_cur"
    EXE=x86_64U
fi
export LD_LIBRARY_PATH

#
#  run xs executable program and exit with xs' exit status
#
#  Note we use "$@" in order to preserve any white space in individual
#  arguments passed to this script; "$@" is equivalent to "$1" "$2" ...
#
exec ${ROOT}/xs.$EXE "$@"
