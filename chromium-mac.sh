#! /usr/bin/env bash
#/Applications/Chromium.app/Contents/MacOS/Chromium  --proxy-server="socks5://localhost:$1" "$2"

# from: https://gist.github.com/stuartsierra/6220797
tmp_dir="/tmp"
timestamp=`date +%Y%m%d%H%M%S`
user_dir="${tmp_dir}/chrome-$timestamp-$RANDOM"
echo "temp dir: ${user_dir}"
open -n -a /Applications/Chromium.app  --args --proxy-server="socks5://localhost:$1" "$2" --user-data-dir=${user_dir}
