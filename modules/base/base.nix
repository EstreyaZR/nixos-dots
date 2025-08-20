{
  pkgs,
  lib,
  ...
}: {
  # Best Bootloader
  boot = {
    loader.limine = {
      enable = lib.mkForce true;
      maxGenerations = lib.mkDefault 10;
    };
    plymouth = {
      enable = true;
    };
  }; ## Common NIX options
  nix = {
    settings = {
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      substituters = [
        "https://nix-community.cachix.org"
      ];
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    optimise = {
      automatic = true;
      dates = ["weekly"];
    };
  };
  nixpkgs = {
    config.allowUnfree = lib.mkDefault true;
    config.nvidia.acceptLicense = true;
  };
  # Never forget NVIM and GIT
  environment.systemPackages = with pkgs; [
    neovim
    nano
    wget
    fastfetch
    clang
    bluetui

    refind

    steam-run
  ];

  programs = {
    nh.enable = lib.mkDefault true;

    fish = {
      enable = lib.mkForce true;
      shellAliases = {
        ls = "eza";
        ll = "eza -loa";

        ff = "fastfetch";
      };
    };
    starship.enable = true;
    git = {
      enable = true;
      config = {
        init = {
          defaultBranch = "main";
        };
      };
    };
  };

  services = {
    flatpak.enable = lib.mkDefault true;
    tuned = {
      enable = lib.mkDefault true;
      ppdSupport = lib.mkDefault true;
      ppdSettings.profiles = lib.mkDefault {
        balanced = "desktop";
        performance = "accelerator-performance";
        power-saver = "desktop-powersave";
      };
      settings.dynamic_tuning = lib.mkDefault true;
    };
    emacs.enable = true;
  };

  hardware = {
    bluetooth.enable = true;
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        libvdpau-va-gl
        intel-media-driver
        intel-vaapi-driver
        mesa
        nvidia-vaapi-driver
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        intel-vaapi-driver
        mesa
        intel-media-driver
      ];
    };
  };

  networking.networkmanager.enable = true;

  xdg.portal = {
    enable = lib.mkForce true;
    extraPortals = lib.mkDefault [pkgs.xdg-desktop-portal-gtk];
  };

  i18n = {
    defaultLocale = lib.mkDefault "de_DE.UTF-8";
    extraLocales = lib.mkDefault [
      "tr_TR.UTF-8/UTF-8"
      "ru_RU.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
      "zh_CN.UTF-8/UTF-8"
      "en_US.UTF-8/UTF-8"
    ];
    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
    #
    inputMethod = {
      enable = true;
      #type = "fcitx5";
      type = "ibus";
      ibus.engines = with pkgs.ibus-engines; [hangul anthy libpinyin];
      #fcitx5.addons = with pkgs; [
      #  fcitx5-anthy
      #  fcitx5-pinyin-moegirl
      #  kdePackages.fcitx5-chinese-addons
      #  kdePackages.fcitx5-qt
      #  kdePackages.fcitx5-with-addons
      #  fcitx5-hangul
      #  fcitx5-m17n
      #];
    };
  };

  users.defaultUserShell = pkgs.fish;
  time.timeZone = lib.mkDefault "Europe/Berlin";

  system.autoUpgrade.enable = lib.mkDefault true;
  system.autoUpgrade.operation = lib.mkDefault "boot";
  system.autoUpgrade.flake = "github:EstreyaZR:nixos-dots";
  system.autoUpgrade.dates = lib.mkDefault "weekly";
}
