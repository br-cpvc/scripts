#!/usr/bin/env bash
# from: https://www.endpoint.com/blog/2014/11/10/finding-specific-git-commit-at-point-in

FILE=$1
HASH=`git hash-object $FILE`
echo "Looking for hash $HASH, of file $FILE"
git rev-list --all \
  | while read commit
 do if git ls-tree -r $commit \
  | grep -F -q $HASH
 then echo "found in git commit $commit"
 break
 fi
 done
