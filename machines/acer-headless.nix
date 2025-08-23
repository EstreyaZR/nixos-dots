# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{pkgs, ...}: {
  imports = [
    ./hw-acer-headless.nix
    ../users/maya.nix
  ];

  networking.hostName = "AcerHeadless"; # Define your hostname.
  boot.loader.efi.canTouchEfiVariables = true;

  services.xserver.videoDrivers = ["nvidia"];

  nixpkgs.config.cudaSupport = true;
  services = {
    xserver.xkb = {
      layout = "de";
      variant = "nodeadkeys";
    };
    udev.extraRules = ''SUBSYSTEM=="usb", ENV{ID_VENDOR_ID}=="0cf3", ENV{ID_MODEL_ID}=="e300", ATTR{authorized}="0"'';
  };
  console.keyMap = "de-latin1-nodeadkeys";

  environment.systemPackages = with pkgs; [
    kitty
    kdePackages.k3b
    retrospy
    retro-gtk
    retroarch-bare
    retroarch-assets
  ];

  hardware.nvidia = {
    prime = {
      sync.enable = true;
      nvidiaBusId = "PCI:1@0:0:0";
      intelBusId = "PCI:0@0:2:0";
    };
    powerManagement.enable = false;
    modesetting.enable = true;
    open = true;
  };

  hardware.nvidia-container-toolkit.enable = true;

  services.ollama = {
    enable = true;
  };
  system.stateVersion = "25.05"; # Did you read the comment?
}
