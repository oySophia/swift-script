#!/bin/sh

echo "**************************configuring each node**************************************"
rm -rf /etc/swift
cd $HOME/swift/doc
cp -r saio/swift /etc/swift
cd -
chown -R ${USER}:${USER} /etc/swift

find /etc/swift/ -name \*.conf | xargs sed -i "s/<your-user-name>/${USER}/"

echo "*****************************setting up scripts for running swift********************"
echo "****************************resetting the environment*********************************"
cd $HOME/swift/doc
cp -r saio/bin $HOME/bin
cd -
chmod +x $HOME/bin/*

echo "**********************edit the home/bin/resetswift************************************"
sed -i "s/dev\/sdb1/srv\/swift-disk/" $HOME/bin/resetswift
sed -i "/find \/var\/log\/swift/d" $HOME/bin/resetswift

echo "************install the sample configuration file for running tests*************************"
cp $HOME/swift/test/sample.conf /etc/swift/test.conf

echo "*************adding an environment variable********************************************"
echo "export SWIFT_TEST_CONFIG_FILE=/etc/swift/test.conf" >> $HOME/.bashrc
echo "************make sure the path includes the bin directory******************************"
echo "export PATH=${PATH}:$HOME/bin" >> $HOME/.bashrc
. $HOME/.bashrc
echo "******************************************************************************
if it shows 'shopt not found', please manunal do the command '. $HOME/.bashrc'
	********************************************************************************"
