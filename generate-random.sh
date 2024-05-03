#!/usr/bin/env bash
set -e

LENGTH=25
if [ ! -z "$1" ] && [ $1 -gt 1 ]; then
	  LENGTH=$1
fi

# inspired by https://www.baeldung.com/linux/generate-random-string-using-random
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $LENGT | head -n 1
