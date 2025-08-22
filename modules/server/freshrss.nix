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
        defaultUser = "freshrss";
        enable = true;
        language = "de";
        webserver = "nginx";
        virtualHost = address;
        baseUrl = "https://${address}";
        #passwordFile = "/var/lib/freshrss/passwd";
        authType = "none";
      };
      nginx = {
        enable = true;
        virtualHosts."${address}" = {
          #  addSSL = true;
        };
      };
    };
  };
}
