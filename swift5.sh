#!/bin/sh

echo "**************************configuring each node**************************************"
rm -rf /etc/swift
cd $HOME/swift/doc
cp -r saio/swift /etc/swift
cd -
chown -R ${USER}:${USER} /etc/swift

find /etc/swift/ -name \*.conf | xargs sed -i "s/<your-user-name>/${USER}/"

