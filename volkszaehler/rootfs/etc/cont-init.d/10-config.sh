#!/usr/bin/with-contenv bash
set -e

CONFIG="/var/www/etc/config.yaml"

if [ ! -f "$CONFIG" ]; then
  echo "[INFO] Creating Volkszähler database configuration"

  cat <<EOF > "$CONFIG"
database:
  driver: pdo_mysql
  host: core-mariadb
  port: 3306
  dbname: volkszaehler
  user: vz
  password: demo
EOF
fi
