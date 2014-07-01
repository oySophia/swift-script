#!/bin/sh

echo "*************************setting up the rsync*******************************************"
cp $HOME/swift/doc/saio/rsyncd.conf /etc/
sed -i "s/<your-user-name>/${USER}/" /etc/rsyncd.conf

sed -i "s/RSYNC_ENABLE=false/RSYNC_ENABLE=true/" /etc/default/rsync

echo "********************start the rsync daemon****************************"
service rsync restart

echo "********************verify the rsync, and you will see:
account6012
account6022
...
object6040
*************************************************************"
rsync rsync://pub@localhost/

echo "*************************starting memcached**************************************************"
service memcached start
