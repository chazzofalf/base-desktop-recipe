#!/bin/bash
if [[ ! -z "$CONFIG_DIR" ]]
then
	rm /etc/ssh/ssh_host_*key*
	for f in rsa dsa ecdsa ed25519
	do
	if [[ -e "$CONFIG_DIR"/"ssh_host_${f}_key" ]] ; then
		cp "$CONFIG_DIR"/"ssh_host_${f}_key" /etc/ssh
		chown root /etc/ssh/ssh_host_${f}_key
		chmod 700 /etc/ssh/ssh_host_${f}_key
	else
		ssh-keygen -t $f /etc/ssh/ssh_host_${f}_key -p ""
		cp /etc/ssh/ssh_host_${f}_key "$CONFIG_DIR"
	fi
fi
