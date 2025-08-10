{
  pkgs,
  lib,
  ...
}: {
  # Best Bootloader
  boot.loader.limine = {
    enable = lib.mkForce true;
    maxGenerations = lib.mkDefault 10;
  };
  ## Common NIX options
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
  };
  # Never forget NVIM and GIT
  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    gh
    fastfetch
  ];

  programs.nh.enable = lib.mkDefault true;
  programs.fish.enable = lib.mkForce true;

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
      ppdSettings.main.default = "performace";
      settings.dynamic_tuning = lib.mkDefault true;
    };
  };

  hardware.bluetooth.enable = lib.mkDefault true;

  networking.networkmanager.enable = lib.mkDefault true;

  xdg.portal = {
    enable = lib.mkForce true;
    extraPortals = lib.mkDefault [pkgs.xdg-desktop-portal-gtk];
  };

  i18n = {
    defaultLocale = "de_DE.UTF-8";
    extraLocales = [
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
    inputMethod.type = "ibus";
    inputMethod.ibus.engines = with pkgs.ibus-engines; [hangul anthy libpinyin];
  };

  users.defaultUserShell = pkgs.fish;
  time.timeZone = lib.mkDefault "Europe/Berlin";

  system.autoUpgrade.enable = lib.mkDefault true;
  system.autoUpgrade.operation = lib.mkDefault "boot";
  system.autoUpgrade.flake = "github:EstreyaZR:nixos-dots";
  system.autoUpgrade.dates = lib.mkDefault "weekly";
}
