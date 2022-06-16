#!/usr/bin/env bash
set -e

source $(dirname $0)/backup_bitwarden_vault.env 

# generate gpg key using:
# gpg --full-generate-key

#echo "test1234" | gpg --pinentry-mode loopback -e -r $gpg_user_id --armor -o encrypter_file.gpg
#cat encrypter_file.txt 
#-----BEGIN PGP MESSAGE-----
# ...
# -----END PGP MESSAGE-----

#cat encrypter_file.gpg | gpg --pinentry-mode loopback -d -o decrypted_file.txt
#gpg: encrypted with 3072-bit RSA key, ID B28D552AE4AA83A4, created 2022-06-16

#cat decrypted_file.txt
#test1234


# inspired by: https://blog.patshead.com/2019/09/backing-up-my-bitwarden-database.html

# from: https://bitwarden.com/help/cli/
# and : https://www.reddit.com/r/Bitwarden/comments/ez6853/how_to_save_a_encrypted_version_of_vault_locally/
# alternatively get-bw-session.sh in https://gist.github.com/seanh/d3d1a6dfa4b7d5d9f135984ae913cf0f

backup_dir="keys/backup/bitwarden/$(date -u '+%Y%m%d-%H%M%S')"
mkdir -p $backup_dir

export BW_SESSION="$(bw unlock --raw)" # ; history -d 1
bw sync

json=$(bw export --format json --raw)
# cli only password, --pinentry-mode loopback
backup_file=$backup_dir/bw_vault.gpg
echo $json | gpg --pinentry-mode loopback -e -r $gpg_user_id --armor -o $backup_file
echo "wrote file: $backup_file"

json=$(bw export --format json --raw --organizationid $bw_org_id)
backup_file=$backup_dir/bw_organization_vault.gpg
echo $json | gpg --pinentry-mode loopback -e -r $gpg_user_id --armor -o $backup_file 
echo "wrote file: $backup_file"

bw lock

