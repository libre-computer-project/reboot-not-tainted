# Reboot Not Tainted

## reboot.sh
This script checks /proc/sys/kernel/tainted to make sure the Linux kernel is not tainted by errors. If there is no taint, it will sleep for 30 seconds and reboot.

## install.sh
This script installs a systemd service called reboot-not-tainted that runs after multi-user.target. It will execute the reboot.sh script.
