# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, home-manager, ... }:

{
  imports = [
    ./hw-acer-headless.nix
    ../users/maya.nix
  ];

  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "Nixos-Acer"; # Define your hostname.

  services.xserver.xkb = {
    layout = "de";
    variant = "nodeadkeys";
  };
  console.keyMap = "de-latin1-nodeadkeys";

  environment.systemPackages = with pkgs; [
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

  hardware.nvidia = {
    prime = {
      sync.enable = true;
      nvidiaBusId = "1.0.0";
      intelBusId = "0.2.0";
    };
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}
