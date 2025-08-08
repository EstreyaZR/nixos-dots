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
    packages = with pkgs; [librewolf];
  };
}
