## SystemD fix
This fix aims to solve the "Failed to get D-Bus connection" when using systemctl.

> Run the script with sudo as it replaces the systemctl binary at /usr/bin/systemctl
```bash
sudo ./systemd-fix.sh
```
