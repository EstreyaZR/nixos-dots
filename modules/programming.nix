{
  pkgs,
  options,
  ...
}: {
  environment.systemPackages = with pkgs; [
    rustup
    llvmPackages.bintools
    clang
    go
    c3c
    c3-lsp

    jdk24

    #android-tools
    #android-studio
    #android-udev-rules
  ];

  users.users.maya.extraGroups = ["kvm"];
}
