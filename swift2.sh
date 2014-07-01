#!/bin/sh

echo "******************using a loopback device for storage**********************"

echo "******************create file for the loopback device*************************"
if [ -e /srv ] ; then
	echo "the file /srv exist!"
else
	mkdir /srv
	truncate -s 10GB /srv/swift-disk
	mkfs.xfs /srv/swift-disk
fi

echo "******************edit /etc/fstab********************************"
#if verify if it's existing
if grep -ci "/srv/swift-disk /mnt/sdb1 xfs" /etc/fstab ; then
	echo "already add the contents"
else
	sed "/^# <file system>/a\/srv/swift-disk /mnt/sdb1 xfs loop,noatime,nodiratime,nobarrier,logbufs=8 0 0" /etc/fstab > /etc/fstab_tmp
	mv /etc/fstab_tmp /etc/fstab
fi

echo "******************mount point and the individualized links*************************************"
if [ -e /mnt/sdb1 ] ; then
	echo "/mnt/sdb1 exists and the work has been done"
else
	mkdir /mnt/sdb1
	mount /mnt/sdb1
	mkdir /mnt/sdb1/1 /mnt/sdb1/2 /mnt/sdb1/3 /mnt/sdb1/4
	chown ${USER}:${USER} /mnt/sdb1/*
	for x in $(seq 4)
	do
		ln -s /mnt/sdb1/$x /srv/$x
	done

	mkdir -p /srv/1/node/sdb1 /srv/2/node/sdb2 /srv/3/node/sdb3 /srv/4/node/sdb4 /var/run/swift
	chown -R ${USER}:${USER} /var/run/swift

	for x in $(seq 4)
	do
		chown -R ${USER}:${USER} /srv/$x
	done
fi

echo "******************add sth. to /etc/rc.local*****************************************"
if grep -ci "mkdir -p /var/cache/swift /var/cache/swift2 /var/cache" /etc/rc.local ; then 
	echo "already add the contents"
else
	for x in "mkdir -p /var/cache/swift /var/cache/swift2 /var/cache/swift3 /var/cache/swift4" \
	"chown root:root /var/cache/swift*" \
	"mkdir -p /var/run/swift" \
	"chown root:root /var/run/swift"
	do
		sed "/exit 0/i\\$x" /etc/rc.local > /etc/rc_tmp.local
		mv /etc/rc_tmp.local /etc/rc.local
	done
fi
