{pkgs, ...}: {
  stylix = {
    enable = true;

    # other cool themes:
    # DARK:
    # rose-pine / rose-pine-moon
    # tokyo-night-storm / tokyo-night-moon
    # valua
    # porple / phd
    #
    # LIGHT:
    # rose-pine-dawn
    # catppuccin-latte

    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml"; #
    polarity = "dark";

    fonts = {
      monospace.package = pkgs.nerd-fonts._0xproto;
      monospace.name = "0xProto";
      sansSerif.package = pkgs.inter;
      sansSerif.name = "Inter";
      serif.package = pkgs.inter;
      serif.name = "Inter";
      emoji.package = pkgs.noto-fonts-color-emoji;
      emoji.name = "Noto Fonts Emoji";
    };
  };
}
