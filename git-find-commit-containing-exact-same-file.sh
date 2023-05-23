#from: https://www.reddit.com/r/git/comments/ja0ro8/given_a_specific_file_how_can_i_find_on_which/

#find_by_hash() {
  hash=`git hash-object $1`
  git rev-list --all -- $2 | while read rev
  do
    git ls-tree -r "$rev" | grep $hash >/dev/null && echo "$rev"
  done
#}
#find_by_hash()

