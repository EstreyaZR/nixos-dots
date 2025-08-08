{
  pkgs,
  options,
  ...
}: {
  environment.systemPackages = with pkgs; [
    rustup
    c3c
  ];
}
