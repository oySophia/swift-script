#!/bin/sh

#getting the code
echo "****************get the python-swiftclient and install it******************************"
if [ -e $HOME/python-swiftclient ]; then
	echo "already git the python-swiftclient.git"
else
	cd $HOME; git clone https://github.com/openstack/python-swiftclient.git
fi

echo "*****************some may get wrong in such step, be careful
and if it is wrong, please refer to my blog
******************************************************************************"
cd $HOME/python-swiftclient
python setup.py develop
cd -

echo "****************get the swift and install it**********************************************"
if [ -e $HOME/swift ]; then
	echo "already git the swift.git"
else
	git clone https://github.com/openstack/swift.git
fi

cd $HOME/swift
python setup.py develop
cd -

#if there is sth. wrong in Fedora 19 or later users, please do such step
#pip install -U xattr

echo "****************install swift's test dependencies********************************"
pip install -r $HOME/swift/test-requirements.txt
