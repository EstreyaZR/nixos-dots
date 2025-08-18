{
  lib,
  config,
  pkgs,
  ...
}: {
  home.stateVersion = "25.05";

  programs = {
    anki.enable = true;
    anki.addons = with pkgs.ankiAddons; [
      passfail2
    ];
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
        };
      };
      settings = {
        "widget.use-xdg-desktop-portal.file-picker" = 1;
        "webgl.disabled" = false;
      };
    };
  };

  home.packages = with pkgs; [
    eza
  ];

  stylix.targets = { 
    librewolf = {
      profileNames = ["main"];
      colorTheme.enable = true;
    };
  };
}
