#! /etc/profiles/per-user/maya/bin/fish
#
#
export confdir="$HOME/Projekte/nixos-dots"

cd $HOME
if ls -la | grep -i '.gtkrc-2.0'
  if ls -la | grep -i '.gtkrc-2.0.bk'
    rm ./.gtkrc-2.0.bk
  end
  if ls -la | grep -i '.gtkrc-2.0'
    rm ./.gtkrc-2.0
  end
end
cd $confdir
git add .
git commit -m "automated commit for update"
sudo nixos-rebuild switch --flake .
