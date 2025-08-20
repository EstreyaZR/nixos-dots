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

    obsidian = {
      enable = true;
      vaults."main" = {
        target = "./Obsidian";
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

  home.packages = with pkgs; [
  ];

  stylix.targets = {
    librewolf = {
      profileNames = ["main"];
      colorTheme.enable = true;
    };
  };

  wayland.windowManager.hyprland = {
    enable = false;
  };
}
