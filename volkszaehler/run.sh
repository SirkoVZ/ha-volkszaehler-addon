#!/usr/bin/with-contenv bash
set -e

echo "[INFO] Starting Volkszähler Middleware"

exec httpd -DFOREGROUND
