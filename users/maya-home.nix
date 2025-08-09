{
  lib,
  config,
  pkgs,
  ...
}: {
  home.stateVersion = "25.05";

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    fish.enable = true;
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
          extraConfig = ''
                   "widget.use-xdg-desktop-portal.file-picker": 1,\n
            "webgl.disabled": false
          '';
        };
      };
      policies = {
        Preferences = {
          "widget.use-xdg-desktop-portal.file-picker" = "1";
          "webgl.disabled" = "false";
        };
        ExtensionSettings = {};
      };
    };
    emacs.enable = true;
  };

  home.packages = with pkgs; [
    blanket
    eza
  ];

  stylix.targets.librewolf.profileNames = ["main"];
  stylix.targets.librewolf.colorTheme.enable = true;
}
