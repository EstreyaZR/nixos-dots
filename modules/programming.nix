{
  pkgs,
  options,
  ...
}: {
  environment.systemPackages = with pkgs; [
    rustup
  ];
}
