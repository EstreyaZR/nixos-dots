{ lib, config, pkgs, ...}:
{
   home.packages = with pkgs; [btop waybar];
   home.stateVersion = "25.05";

   programs = {
     direnv = {
       enable = true;
       nix-direnv.enable = true;
     };

     fish.enable = true;
     anki.enable = true;
      neovim = {
	enable = true;
	viAlias = true;
	vimAlias = true;
	defaultEditor = true;

	plugins = with pkgs.vimPlugins; [
	  nvim-treesitter
	  nvim-treesitter.withAllGrammars
	  vim-lsp-snippets
	  vim-lsp
	  nvim-lsp-notify

	  obsidian-nvim
	];
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
      emacs.enable = true;
   };

   stylix.targets.librewolf.profileNames = [ "main" ];
   stylix.targets.librewolf.colorTheme.enable = true;
}
