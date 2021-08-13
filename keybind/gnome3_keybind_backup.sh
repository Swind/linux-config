#!/usr/bin/env bash

# Backs up and restores gnome3 keybindings

set -e

if [[ $1 == 'backup' ]]; then
  dconf dump '/org/gnome/desktop/wm/keybindings/' > gnome-keybindings.dconf
  dconf dump '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/' > gnome-custom-keybindings.dconf
  echo "backup done"
  exit 0
fi
if [[ $1 == 'restore' ]]; then
  dconf load '/org/gnome/desktop/wm/keybindings/' < gnome-keybindings.dconf
  dconf load '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/' < gnome-custom-keybindings.dconf
  echo "restore done"
  exit 0
fi

echo "parameter 0: [backup|restore]"
