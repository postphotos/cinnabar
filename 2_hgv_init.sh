#!/bin/bash
# Bash script to set up HGV
#vagrant plugin install vagrant-ghost
#vagrant plugin install vagrant-hostsupdater
vagrant global-status --prune
pwd= `pwd`
cd ~/Sites/

echo  "Welcome to the HGV install!

We're assuming you've set up your tools already and are all ready to go.
What's the name of the project?"
read name
git clone https://github.com/wpengine/hgv.git $name
cd ./$name
npm install
#alias vsh="vagrant ssh"

mkdir -p hgv_data/config/sites
touch hgv_data/config/sites/$name.yml
touch default-install.yml
printf "# DO NOT EDIT: Default WP install and domains for HGV. Instead, copy to a new file under hgv_data/config/sites/.'
---
wp:
  enviro: "$name"
  hhvm_domains:
    - "$name".test
  php_domains:
    - php."$name".test

">> hgv_data/config/sites/$name.yml

# sed -i 'Ns/.*/replacement-line/' file.txt ## https://stackoverflow.com/questions/11145270/bash-replace-an-entire-line-in-a-text-file
# lineinfile: dest=/etc/hosts line="127.0.0.1 hgv.test hhvm.hgv.test php.hgv.test cache.php.hgv.test cache.hhvm.hgv.test"

vagrant up --provision

##     >> hgv_data/config/sites/$name.yml
## while true; do 
## 	echols "Do you want to merge a site onto this install?" yn
##     case $yn in
##         [Yy]* ) break;;
##         [Nn]* ) exit;;
##         * ) echo "Please answer yes or no.";;
##     esac
## done

##echo "
##Where does this site live?"
##read site
##if [ -d "$site" ]; then
##  # Control will enter here if $DIRECTORY exists.
##  rsync -avx $site ./hgv_data/$name/
##else
##	echo "That Wasn't a valid directory, you'll have to do merge by hand."
##fi

#### #!/bin/bash
###### Eventually this might be a solve to checking for local IPs before building
#### LOCALIP="192.168.150.21"
#### IPCHECK=`ping -c 1 $LOCALIP &> /dev/null && echo success || echo fail`
#### echo $IPCHECK

## open ./hgv_data/$name/
## cd ../
## open http://"$name".test/

## echo '
## 

## All done!'

#!/bin/bash
# Bash script to set up HGV
echo 'Your box is being provisioned. In Finder, a window where your WP Install is has been opened.

Feel Free to migrate by hand.'
open ./hgv_data/sites/$name/
vagrant global-status --prune
vagrant up --provision
open http://"$name".test/
cd $pwd
echo '


All done!'
