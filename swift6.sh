#!/bin/sh

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

echo "************************************************************************************
*************************************construct the initial rings*************************
and the outputs are like that:
Device d0r1z1-127.0.0.1:6010R127.0.0.1:6010/sdb1_"" with 1.0 weight got id 0
Device d1r1z2-127.0.0.1:6020R127.0.0.1:6020/sdb2_"" with 1.0 weight got id 1
Device d2r1z3-127.0.0.1:6030R127.0.0.1:6030/sdb3_"" with 1.0 weight got id 2
******************************************************************************************"
remakerings

echo "************verify the unit tests run************************************************"
$HOME/swift/.unittests

#you should run the 10-th step according to the illustration
echo "********you should run the 10-th step according to the illustrations**************************"
