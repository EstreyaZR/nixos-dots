{pkgs, ...}: {
  programs.nvf = {
    enable = true;

    settings.vim = {
      dashboard.dashboard-nvim.enable = true;
      filetree.neo-tree.enable = true;
      git.enable = true;
      autocomplete = {
        blink-cmp.enable = true;
        enableSharedCmpSources = true;
        blink-cmp.friendly-snippets.enable = true;
      };

      viAlias = true;
      vimAlias = true;
      lsp.enable = true;
      lsp.formatOnSave = true;
      lsp.inlayHints.enable = true;

      lineNumberMode = "relNumber";

      diagnostics = {
        nvim-lint.enable = true;
      };

      options = {
        shiftwidth = 0;
        tabstop = 2;
      };

      snippets.luasnip.enable = true;
      statusline.lualine.enable = true;

      projects.project-nvim.enable = true;

      navigation.harpoon.enable = true;
      notes.obsidian.enable = true;

      syntaxHighlighting = true;
      tabline.nvimBufferline.enable = true;

      languages = {
        enableFormat = true;
        enableTreesitter = true;

        bash.enable = true;
        nix.enable = true;
        rust.enable = true;
        python.enable = true;
        go.enable = true;
        gleam.enable = true;
        css.enable = true;
        html.enable = true;
        java.enable = true;
        yaml.enable = true;
        clang.enable = true;
        lua.enable = true;
        sql.enable = true;
      };
    };
  };
}
