{ pkgs, ...}:
{
  programs.nvf = {
    enable = true;
    
    settings.vim = {
      viAlias = true;
      vimAlias = true;
      lsp.enable = true;
      lsp.formatOnSave = true;

      languages = {
        enableFormat = true;
        enableTreesitter = true;
        rust.enable = true;
        python.enable = true;
        gleam.enable = true;

    };
  };
  };
}
