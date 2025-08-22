{
  pkgs,
  pkgs-stable,
  options,
  ...
}: {
  environment.systemPackages =
    (with pkgs; [
      #llvmPackages.bintools
      #clang
      #go
      #android-tools
      #android-studio
      #android-udev-rules
    ])
    ++ (with pkgs-stable; [
      c3c
      c3-lsp
      rustup
      rustfmt
      rust-analyzer
    ]);

  users.users.maya.extraGroups = ["kvm"];
  programs.java.enable = true;
}
