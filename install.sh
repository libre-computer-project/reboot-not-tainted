#!/bin/bash

if [ "$USER" != "root" ]; then
	echo "Please sudo or run as root." >&2
	exit 1
fi

cd $(readlink -f $(dirname ${BASH_SOURCE[0]}))

cat <<EOF > /etc/systemd/system/reboot-not-tainted.service
[Unit]
Description=reboot-not-tainted
After=multi-user.target

[Service]
ExecStart=$PWD/reboot.sh

[Install]
WantedBy=graphical.target
EOF

systemctl daemon-reload
systemctl enable reboot-not-tainted.service
