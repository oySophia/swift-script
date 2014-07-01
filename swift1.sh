#!/bin/sh

echo "***********update*****************"
apt-get update
echo "***********some lib required***********************"
apt-get install curl gcc memcached rsync sqlite3 xfsprogs \
	git-core libffi-dev python-setuptools
echo "***********some python lib needed***********************"
apt-get install python-coverage python-dev python-nose \
	python-simplejson python-xattr python-eventlet \
	python-greenlet python-pastedeploy \
	python-netifaces python-pip python-dnspython \
	python-mock
