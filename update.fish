#! /etc/profiles/per-user/maya/bin/fish
#
#
export confdir="$HOME/Projects/nixos-dots"

cd $HOME
if ls -la | grep -i '.gtkrc'
  rm ./.gtkrc-2.0
end
cd $confdir
git add .
git commit -m "automated commit for update"
sudo nixos-rebuild switch --flake .
