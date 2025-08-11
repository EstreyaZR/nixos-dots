# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  home-manager,
  lib,
  ...
}: {
  imports = [
    ./hw-acer-headless.nix
    ../users/maya.nix
  ];

  networking.hostName = "Nixos-Acer"; # Define your hostname.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth = {
    enable = true;
  };

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
    displayManager.sddm.package = lib.mkDefault pkgs.kdePackages.sddm;
    displayManager.sddm.wayland.compositor = "kwin";
    xserver.xkb = {
      layout = "de";
      variant = "nodeadkeys";
    };
  };
  console.keyMap = "de-latin1-nodeadkeys";

  environment.systemPackages = with pkgs; [
    kitty
    kdePackages.k3b
    kdePackages.ark
    (pkgs.alpaca.override {
      ollama = pkgs.ollama-cuda;
    })
    kdePackages.kdenlive
    krita
  ];

  programs = {
    starship.enable = true;
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
