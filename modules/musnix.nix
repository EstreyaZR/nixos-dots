{pkgs, ...}: {
  musnix.enable = true;
  users.users.maya.extraGroups = ["audio"];
}
