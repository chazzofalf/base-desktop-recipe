#!/bin/bash
if [[ ! -e /home/$XDOCKERUSER/.ssh/authorized_keys ]]
then
	if [[ ! -e ${CONFIG_DIR}/hostname ]]
	then
		rm ${CONFIG_DIR}/torlogin
	fi
	if [[ ! -e ${CONFIG_DIR}/torlogin ]]
	then
		ssh-keygen -t rsa -b 4096 -f ${CONFIG_DIR}/torlogin -P ""
	fi
	cat ${CONFIG_DIR}/login.pub > /home/$XDOCKERUSER/.ssh/authorized_keys
	chmod 700 /home/$XDOCKERUSER/.ssh/authorized_keys
	chown $XDOCKERUSER /home/$XDOCKERUSER/.ssh/authorized_keys
fi
