set -e

# from: https://askubuntu.com/questions/340809/how-can-i-adjust-the-default-passphrase-caching-duration-for-gpg-pgp-ssh-keys

# gsettings list-keys org.gnome.crypto.cache
# gpg-cache-method
# gpg-cache-ttl

# default:

# gsettings get org.gnome.crypto.cache gpg-cache-ttl 
# 300

# gsettings get org.gnome.crypto.cache gpg-cache-method
# 'session'

gsettings set org.gnome.crypto.cache gpg-cache-method 'timeout'
gsettings set org.gnome.crypto.cache gpg-cache-ttl 1800
gnome-keyring-daemon -r

