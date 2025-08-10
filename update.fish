#! /etc/profiles/per-user/maya/bin/fish
#
#

export $SYSTEM_CONFIG="$HOME/Projects/nixos-dots/"

echo $HOME
cd $HOME
rm .gtkrc-2.0
cd $SYSTEM_CONFIG
sudo nixos-rebuild switch --flake .
