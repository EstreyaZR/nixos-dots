# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, home-manager, ... }:

{
  imports = [
    ./hw-acer-headless.nix
    ../users/maya.nix
  ];

  boot.loader.limine = {
    enable = true;
    maxGenerations = 10;
  };

  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Nixos-Acer"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "de_DE.UTF-8";
  i18n.extraLocales = [
    "tr_TR.UTF-8/UTF-8"
    "ru_RU.UTF-8/UTF-8"
    "ja_JP.UTF-8/UTF-8"
    "zh_CN.UTF-8/UTF-8"
    "en_US.UTF-8/UTF-8"
  ];

  i18n.extraLocaleSettings = {
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

  i18n.inputMethod.type = "ibus";
  i18n.inputMethod.ibus.engines = with pkgs.ibus-engines; [ hangul anthy libpinyin ] ;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "de-latin1-nodeadkeys";

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
   neovim 
   wget git gh fastfetch obsidian

   kitty rofi-wayland-unwrapped
  ];

  programs = { 
    fish.enable = true;
    starship.enable = true;

    hyprland = {
      enable = true;
      withUWSM = true;
    };
  };

  hardware.bluetooth.enable = true;
  hardware.nvidia = {
    prime = {
      sync.enable = true;
      nvidiaBusId = "1.0.0";
      intelBusId = "0.2.0";
    };
  };

  services = {
    flatpak.enable = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # networking.firewall.enable = false;

  system.stateVersion = "25.05"; # Did you read the comment?

  nix = {
    gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
    };
    settings.auto-optimise-store = true;
    optimise = {
      automatic = true;
      dates = ["weekly"];
    };
  };
}
