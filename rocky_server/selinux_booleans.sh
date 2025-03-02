#!/bin/bash

set -e

services=(
    "httpd_can_network_connect"
    "nis_enabled"
    "samba_domain_controller"
    "authlogin_nsswitch_use_ldap"
    "allow_ypbind"
    "ssh_keysign"
    "logrotate_read_inside_containers"
    "cron_can_relabel"
)

for service in "${services[@]}"; do
    if sudo setsebool -P "$service" 1; then
        echo "[!] $service set successfully."
    else
        echo "[!] Failed to set $service."
    fi
done