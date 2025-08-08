{ lib, config, pkgs, ...}:
{
   home.stateVersion = "25.05";

   programs = {
     direnv = {
       enable = true;
       nix-direnv.enable = true;
     };

     fish.enable = true;
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
	  LazyVim
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
      emacs.enable = true;
   };

   home.packages = with pkgs; [
obsidian anki
   ];

   stylix.targets.librewolf.profileNames = [ "main" ];
   stylix.targets.librewolf.colorTheme.enable = true;
}
