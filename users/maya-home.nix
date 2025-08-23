{
  pkgs,
  lib,
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
        };
      };
      settings = {
        "widget.use-xdg-desktop-portal.file-picker" = 1;
        "webgl.disabled" = false;
      };
    };

    gh.enable = true;
    fzf.enable = true;
    ripgrep-all.enable = true;
    eza = {
      enable = true;
      enableFishIntegration = true;
    };
  };

  stylix.targets = {
    librewolf = {
      profileNames = ["main"];
      colorTheme.enable = true;
    };
    qt.platform = "qtct";
  };
}
