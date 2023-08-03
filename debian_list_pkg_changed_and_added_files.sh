#!/usr/bin/env bash
set -ex

echo "NOTE: should be executed with super user privs, e.g. using sudo"

# from: https://superuser.com/questions/676075/get-a-diff-of-my-current-linux-configuration-to-a-default-configuration-across
#debsums -ca

# from: https://askubuntu.com/questions/318483/list-files-not-originating-from-packages

##find / -xdev -type f | sort >/tmp/root.files
#find / -xdev -type f -path /home -prune -o -path /var -prune -o -print | sort >/tmp/root.files
#sort /var/lib/dpkg/info/*.list >/tmp/installed.files
#comm -23 /tmp/root.files /tmp/installed.files
{ \
    find "${PREFIX-}/" -xdev -type f && \
    echo "" && \
    cat -- "${PREFIX}"/var/lib/dpkg/info/*.list; \
} | awk '
    done { --seen[$0]; }
    /^$/ { done = 1; }
    !done { files[++n] = $0; ++seen[$0]; }
    END { for (i = 1; i <= n; ++i) { if (seen[files[i]] > 0) { print(files[i]); } } }
' && debsums --admindir="${PREFIX-}"/var/lib/dpkg -a -c 2> /dev/null