{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.estreya.freshrss;
  address = "rss.estreya.com";
in {
  options.estreya.freshrss.enable = lib.mkEnableOption "Podman Setup";
  config = lib.mkIf cfg.enable {
    services = {
      freshrss = {
        enable = true;
        language = "de";
        webserver = "nginx";
        virtualHost = address;
        baseUrl = "https://${address}";
        authType = "http_form";
        passwordFile = "/var/lib/freshrss/passwd";
      };
      nginx = {
        enable = true;
        #virtualHosts."${address}" = {
        #};
      };
    };
    #security.acme.acceptTerms = true;
  };
}
