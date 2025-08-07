{ lib, config, pkgs, ...}:
{
   home.packages = with pkgs; [btop waybar];
   home.stateVersion = "25.05";

   programs = {
      anki.enable = true;
      neovim = {
	enable = true;
	viAlias = true;
	vimAlias = true;
	defaultEditor = true;
      };
      git = {
	enable = true;
	userName = "Maya Ella Mampf";
	userEmail = "zrezlon@gmail.com";
      };
      librewolf = {
        enable = true;
	profiles = {
	  main = {
	    extensions.force = true;
	  };
	};
      };
      obsidian.enable = true;
   };

   wayland.windowManager.hyprland.systemd.enable = true;

   stylix.targets.librewolf.profileNames = [ "main" ];
   stylix.targets.librewolf.colorTheme.enable = true;
}
