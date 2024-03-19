{
  config,
  pkgs,
  ...
}: let
  plugins = pkgs.vimPlugins;
  theme = config.colorScheme.palette;
in {
  programs.nixvim = {
    enable = true;

    globals.mapleader = " "; # Sets the leader key to space

    colorschemes.tokyonight.enable = true;
    options = {
      clipboard = "unnamedplus";
      number = true; # Show line numbers
      relativenumber = true; # Show relative line numbers
      softtabstop = 2;
      smartindent = true;
      wrap = false;
      swapfile = false;
      backup = false;
      hlsearch = false;
      incsearch = true;
      termguicolors = true;
      scrolloff = 8;
      updatetime = 50;
    };

    plugins = {
      barbecue.enable = true;
      indent-blankline.enable = true;
      bufferline = {
        enable = true;
      };
      gitsigns.enable = true;
      telescope = {
        enable = true;
        keymaps = {
          "<leader><leader>" = "find_files";
          "<leader>/" = "live_grep";
        };
      };
      nvim-colorizer.enable = true;
      nvim-autopairs.enable = true;
      nix.enable = true;
      comment-nvim.enable = true;
      startup = {
        enable = true;
        theme = "dashboard";
      };
      lsp = {
        enable = true;
        servers = {
          tsserver.enable = true;
          lua-ls.enable = true;
          bashls.enable = true;
          nixd.enable = true;
          html.enable = true;
          ccls.enable = true;
          cmake.enable = true;
          csharp-ls.enable = true;
          cssls.enable = true;
          gopls.enable = true;
          jsonls.enable = true;
          pyright.enable = true;
          tailwindcss.enable = true;
        };
      };
      notify.enable = true;
      rust-tools = {
        enable = true;
      };
      conform-nvim = {
        enable = true;
        formattersByFt = {
          lua = ["stylua"];
          nix = ["alejandra"];
        };
        formatOnSave = ''{async = true, lsp_fallback = "always"}'';
      };
      lsp-lines.enable = true;
      treesitter = {
        enable = true;
        nixGrammars = true;
      };
      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
        sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
        ];
        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = {
            action = ''cmp.mapping.select_next_item()'';
            modes = ["i" "s"];
          };
        };
      };
      which-key = {
        enable = true;
        registrations = {
          "<leader>fs" = "file save";
        };
      };
    };

    extraPlugins = [plugins.telescope-file-browser-nvim];

    extraConfigLua = builtins.readFile ./nvim/config.lua;

    extraConfigVim = ''
      set noshowmode
      inoremap jj <ESC>
    '';

    keymaps = [
      {
        mode = "n";
        key = "<space>fb";
        action = ":Telescope file_browser<CR>";
        options.noremap = true;
      }
      {
        key = "<Tab>";
        action = ":bnext<CR>";
        options.silent = false;
      }
      {
        key = "<S-Tab>";
        action = ":bprev<CR>";
        options.silent = false;
      }
    ];
  };
}
