#!/bin/sh

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

echo "************start the main swift daemon processes**********************************************************"
startmain

#you should run the 10-th step according to the illustration
echo "********you should run the 11-th step according to the illustrations**************************"
