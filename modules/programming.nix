{
  pkgs,
  pkgs-stable,
  options,
  ...
}: {
  environment.systemPackages =
    (with pkgs; [
      llvmPackages.bintools
      cargo
      rustc
      clang
      go

      jdk24

      #android-tools
      #android-studio
      #android-udev-rules
    ])
    ++ (with pkgs-stable; [
      c3c
      c3-lsp
    ]);

  users.users.maya.extraGroups = ["kvm"];
}
