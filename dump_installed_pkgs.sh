#!/usr/bin/env bash
ts=$(date -u '+%Y%m%d-%H%M%S')
dstdir="pkgs_installed/$ts"
mkdir -p $dstdir
echo "dumping to folder: $dstdir"

if [ -x "$(command -v apt)" ]; then
 dstfile="$dstdir/apt.txt"
 echo "writing: $dstfile"
 apt list --installed > $dstfile
fi

if [ -x "$(command -v pip)" ]; then
 dstfile="$dstdir/pip.txt"
 echo "writing: $dstfile"
 pip list > $dstfile
fi

# should we also do sudo pip

if [ -x "$(command -v brew)" ]; then
 dstfile="$dstdir/brew.txt"
 echo "writing: $dstfile"
 brew list --versions > $dstfile
fi

if [ -x "$(command -v conda)" ]; then
 dstfile="$dstdir/conda.txt"
 echo "writing: $dstfile"
 conda env export --name base > $dstfile
fi

if [ -x "$(command -v snap)" ]; then
 dstfile="$dstdir/snap.txt"
 echo "writing: $dstfile"
 snap list > $dstfile
fi

if [ -x "$(command -v flatpak)" ]; then
 dstfile="$dstdir/flatpak.txt"
 echo "writing: $dstfile"
 flatpak list > $dstfile
fi
