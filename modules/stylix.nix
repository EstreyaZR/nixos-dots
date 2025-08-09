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

    base16Scheme = "${pkgs.base16-schemes}/share/themes/moonlight.yaml"; #
    polarity = "light";

    fonts = {
      monospace = pkgs.nerd-fonts._0xproto;
      sansSerif = pkgs.inter;
      serif = pkgs.inter;
      emoji = pkgs.noto-fonts-color-emoji;
    };
  };
}
