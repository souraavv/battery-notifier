# battery-notifier
This contains system daemon file and bash script which can be used to save your battery health.  It will notify you when you battery is charge above some given percentage. All these setting can be change in battery-status.sh file.

1. Move the file battery-status.sh to /opt/scripts/
2. Make sure that batter-status.sh have execute permission
   ```bash
   sudo chmod +x /opt/scripts/battery-status.sh
   ```
4. Make a daemon service file battery.service with sudo permission at /etc/systemd/system/
5. To start the service
    ```bash
    sudo systemctl start battery.service
    ```
6. If you want service to start every time when you boot
   ```bash
   sudo systemctl enable battery.service
   ```
7. To stop the service
    ```bash
    sudo systemctl stop battery.service
    ```
8. To check the status of service
    ```bash
    sudo systemctl status battery.service
    ```
