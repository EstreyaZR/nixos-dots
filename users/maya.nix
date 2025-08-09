{
  lib,
  pkgs,
  ...
}: {
  users.users.maya = {
    description = "Maya Ella Mampf";
    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      librewolf
      ripgrep
      fzf

      # ndstool ndstrim ctrtool nihstro cargo-3ds

      bign-handheld-thumbnailer
      ffmpegthumbnailer
      epub-thumbnailer
    ];
  };

  programs.bat.enable = true;
}
