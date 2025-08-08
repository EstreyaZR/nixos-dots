{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    libreoffice-qt6
    obsidian
    anki
    jamesdsp
  ];

  services.pipewire.pulse.enable = true;
}
