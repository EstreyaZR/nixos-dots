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
   };
}
