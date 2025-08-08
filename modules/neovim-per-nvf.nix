{pkgs, ...}: {
  programs.nvf = {
    enable = true;

    settings.vim = {
      autocomplete.blink-cmp.enable = true;
      autocomplete.enableSharedCmpSources = true;
      autocomplete.blink-cmp.friendly-snippets.enable = true;

      viAlias = true;
      vimAlias = true;
      lsp.enable = true;
      lsp.formatOnSave = true;

      diagnostics = {
        nvim-lint.enable = true;
      };

      languages = {
        enableFormat = true;
        enableTreesitter = true;
        nix.enable = true;
        rust.enable = true;
        python.enable = true;
        go.enable = true;
        gleam.enable = true;
        css.enable = true;
        html.enable = true;
        java.enable = true;
        yaml.enable = true;
      };
    };
  };
}
