# Volkszähler Home Assistant Add-on

Dieses Repository enthält die **Volkszähler Middleware** als Add-on für Home Assistant.

- Nutzt die eine bestehende MariaDB ( z.B. von HA `core-mariadb` oder auf irgendeinem anderen host)
- Ingress-fähig
- Installierbar über Home Assistant Add-on Store (Repository-URL)

## Installation

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FSirkoVZ%2Fha-volkszaehler-addon)

Oder manuell:
1. Home Assistant -> Einstellungen -> Add-ons > Add-on Store
2. Drei-Punkte-Menü -> Repositories -> URL hinzufügen:
https://github.com/volkszaehler/volkszaehler.org
3. Addon auswählen und Installieren, Konfigurieren, Starten, Zugriff auf Benutzeroberfläche über Seitenleiste oder Direktaufruf
