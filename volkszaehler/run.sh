#!/usr/bin/with-contenv bash
set -e

echo "[INFO] Starting Volkszaehler Middleware"

exec httpd -DFOREGROUND
