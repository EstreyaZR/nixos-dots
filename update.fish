#! /etc/profiles/per-user/maya/bin/fish
#
#
export confdir="$HOME/Projects/nixos-dots"

cd $HOME
if ls -la | grep -i '.gtkrc'
  rm ./.gtkrc-2.0
end
cd $confdir
sudo nixos-rebuild switch --flake .
