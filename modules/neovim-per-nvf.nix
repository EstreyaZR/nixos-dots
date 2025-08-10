{pkgs, ...}: {
  programs.nvf = {
    enable = true;

    settings.vim = {
      formatter.conform-nvim.enable = true;
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
      lsp = {
        enable = true;
        formatOnSave = true;
        inlayHints.enable = true;
        lightbulb.enable = true;
        lspconfig.enable = true;
      };

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
      syntaxHighlighting = true;

      tabline.nvimBufferline.enable = true;

      languages = {
        enableFormat = true;
        enableTreesitter = true;

        bash = {
          enable = true;
          lsp.enable = true;
        };
        nix = {
          enable = true;
          lsp.enable = true;
        };
        rust = {
          enable = true;
          lsp.enable = true;
          lsp.opts = ''
            [rust-analyzer] = {
              cargo = {allFeature = true},
              checkOnSave = true,
              procMacro = {
                enable = true,
              },
            },
          '';
        };

        java = {
          enable = true;
          lsp.enable = true;
        };
        css = {
          enable = true;
          lsp.enable = true;
        };

        go = {
          enable = true;
          lsp.enable = true;
        };

        python = {
          enable = true;
          lsp.enable = true;
        };
        lua = {
          enable = true;
          lsp.enable = true;
        };
        gleam = {
          enable = true;
          lsp.enable = true;
        };
        yaml = {
          enable = true;
          lsp.enable = true;
        };
        clang = {
          enable = true;
          lsp.enable = true;
        };
        html = {
          enable = true;
        };
        sql = {
          enable = true;
          lsp.enable = true;
        };
      };
    };
  };
}
