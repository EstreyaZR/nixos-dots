{
  pkgs,
  lib,
  ...
}: {
  boot.loader.limine = {
    enable = true;
    maxGenerations = 10;
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    settings.auto-optimise-store = true;
    settings.experimental-features = ["nix-command" "flakes"];
    optimise = {
      automatic = true;
      dates = ["weekly"];
    };
  };

  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    gh
    fastfetch
  ];

  nixpkgs.config.allowUnfree = true;
  programs.nh.enable = true;
  programs.fish.enable = true;

  services.flatpak.enable = true;
  hardware.bluetooth.enable = true;

  networking.networkmanager.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
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
  time.timeZone = "Europe/Berlin";

  system.autoUpgrade.enable = true;
  system.autoUpgrade.operation = "boot";
  system.autoUpgrade.flake = "github:EstreyaZR:nixos-dots";
  system.autoUpgrade.dates = "weekly";
}
