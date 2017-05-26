#!/bin/bash
# Bash script to set up HGV
cd ~/Sites/
echo "What's your install called?"
read name
echo 'Your box is being provisioned. In Finder, a window where your WP Install is has been opened.

Feel Free to migrate by hand.'
cd $name
open hgv_data/sites/$name/
vagrant global-status --prune
vagrant up --provision
open http://"$name".test/

cd $pwd
echo '


All done!'
