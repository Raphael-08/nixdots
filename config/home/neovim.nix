{ config, pkgs, ... }:

let
  plugins = pkgs.vimPlugins;
  theme = config.colorScheme.palette;
in 
  {
    programs.nixvim = {
      enable = true;

      globals.mapleader = " "; # Sets the leader key to space


      opts = {
        clipboard="unnamedplus";
        # Enable relative line numbers
        number = true;         
        relativenumber = true;

        # Set tabs to 2 spaces
        tabstop = 2;
        shiftwidth = 2;       
        softtabstop = 2;
        expandtab = true;
        shiftround = true;

        # Enable auto indenting and set it to spaces
        smartindent = true;

        # Enable smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
        breakindent = true;

        # Enable text wrap
        wrap = true;        
        smartcase = true;
        swapfile = false;
        backup = false;

        # Enable incremental searching
        hlsearch = false;
        incsearch = true;

        # Enable 24-bit colors
        termguicolors = true;
        scrolloff = 8;
        updatetime = 50;
      };
      colorschemes.base16.enable = true;
      colorschemes.base16.colorscheme = {
        base00 = "#${theme.base00}";
        base01 = "#${theme.base01}";
        base02 = "#${theme.base02}";
        base03 = "#${theme.base03}";
        base04 = "#${theme.base04}";
        base05 = "#${theme.base05}";
        base06 = "#${theme.base06}";
        base07 = "#${theme.base07}";
        base08 = "#${theme.base08}";
        base09 = "#${theme.base09}";
        base0A = "#${theme.base0A}";
        base0B = "#${theme.base0B}";
        base0C = "#${theme.base0C}";
        base0D = "#${theme.base0D}";
        base0E = "#${theme.base0E}";
        base0F = "#${theme.base0F}";
      };

      plugins = {
        barbecue.enable = true;  
        gitsigns.enable = true;
        neo-tree.enable = true;
        lsp-format.enable = true;
        surround.enable = true;
        luasnip = {
          enable = true;
          extraConfig = {
            enable_autosnippets = true;
            store_selection_keys = "<Tab>";
          };
          fromVscode = [
            {
              lazyLoad = true;
              paths = "${pkgs.vimPlugins.friendly-snippets}";
            }
          ];
        };

        lspkind = {
          enable = true;
          symbolMap = {
            Copilot = "";
          };
          extraOptions = {
            maxwidth = 50;
            ellipsis_char = "...";
          };
        };
        cmp.enable = true;
        lazy.enable = true;
        telescope = {
          enable = true;
          keymaps = {
            "<leader>ff" = "find_files";
            "<leader>lg" = "live_grep";
          };
        };
        indent-blankline.enable = true;
        nvim-colorizer.enable = true;
        nvim-autopairs.enable = true;
        nix.enable = true;
        comment.enable = true;
        lualine = {
          enable = true;
        };
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
            eslint.enable = true;
            rust-analyzer = {
              enable = true;
              installRustc = true;
              installCargo = true;
            };
            html.enable = true;
            ccls.enable = true;
            cmake.enable = true;
            emmet_ls.enable = true;
            cssls.enable = true;
            gopls.enable = true;
            jsonls.enable = true;
            pyright.enable = true;
            tailwindcss.enable = true;
            java-language-server.enable = true;
            nixd.enable = true;
          };
        };
        lsp-lines.enable = true;
        treesitter = {
          enable = true;
          nixGrammars = true;
        };
        cmp.settings = {
          enable = true;
          autoEnableSources = true;
          sources = [
            { name = "nvim_lsp"; }
            { name = "nvim_lsp_document_symbol"; }
            { name = "nvim_lsp_signature_help"; }
            { name = "luasnip"; }
            { name = "path"; }
          ];
          mapping = {
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C+c>" = "cmp.mapping.abort()";
            "<Esc>" = "cmp.mapping.abort()";
            "<CR>" = "cmp.mapping.confirm({ select = false })";

            "<C-p>" = "cmp.mapping.select_prev_item()";
            "<C-n>" = "cmp.mapping.select_next_item()";

            "<Up>" = "cmp.mapping.select_prev_item()";
            "<Down>" = "cmp.mapping.select_next_item()";

            "<C-Space>" = "cmp.mapping.complete({})";

            "<Tab>" = ''
            cmp.mapping(
              function(fallback)
              if cmp.visible() then
              cmp.select_next_item()
              elseif require("luasnip").expand_or_locally_jumpable() then
              require("luasnip").expand_or_jump()
              elseif has_words_before() then
              cmp.complete()
              else
              fallback()
              end
              end,
              {"i", "s"}
              )
              '';

              "<S-Tab>" = ''
              cmp.mapping(
                function(fallback)
                if cmp.visible() then
                cmp.select_prev_item()
                elseif require("luasnip").jumpable(-1) then
                require("luasnip").jump(-1)
                else
                fallback()
                end
                end,
                {"i", "s"}
                )
                '';
              };
              snippet.expand = ''
              function(args)
              require('luasnip').lsp_expand(args.body)
              end
              '';
            };
            conform-nvim = {
              enable = true;
              formatOnSave = {
                lspFallback = true;
                timeoutMs = 500;
              };
              notifyOnError = true;
              formattersByFt = {
                html = [
                  [
                    "prettierd"
                    "prettier"
                  ]
                ];
                css = [
                  [
                    "prettierd"
                    "prettier"
                  ]
                ];
                javascript = [
                  [
                    "prettierd"
                    "prettier"
                  ]
                ];
                javascriptreact = [
                  [
                    "prettierd"
                    "prettier"
                  ]
                ];
                typescript = [
                  [
                    "prettierd"
                    "prettier"
                  ]
                ];
                typescriptreact = [
                  [
                    "prettierd"
                    "prettier"
                  ]
                ];
                python = [ "black" ];
          # lua = [ "stylua" ];
          nix = [ "alejandra" ];
          markdown = [
            [
              "prettierd"
              "prettier"
            ]
          ];
          rust = [ "rustfmt" ];
        };
      };
    };

    extraPlugins = [ plugins.telescope-file-browser-nvim ];

    # FOR NEOVIDE
    extraConfigLua = '' 
    vim.opt.guifont = "JetBrainsMono\\ NFM,Noto_Color_Emoji:h14"
    vim.g.neovide_cursor_animation_length = 0.05

    local colors = {
      blue   = '#${theme.base0D}',
      cyan   = '#${theme.base0C}',
      black  = '#${theme.base00}',
      white  = '#${theme.base05}',
      red    = '#${theme.base08}',
      violet = '#${theme.base0E}',
      grey   = '#${theme.base02}',
    }

    local bubbles_theme = {
      normal = {
        a = { fg = colors.black, bg = colors.violet },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.black, bg = colors.black },
      },

      insert = { a = { fg = colors.black, bg = colors.blue } },
      visual = { a = { fg = colors.black, bg = colors.cyan } },
      replace = { a = { fg = colors.black, bg = colors.red } },

      inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.black, bg = colors.black },
      },
    }

    require('lualine').setup {
      options = {
        theme = bubbles_theme,
        component_separators = '|',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = { 'filename', 'branch' },
        lualine_c = { 'fileformat' },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {},
      require("neo-tree").setup({
        event_handlers = {
          {
            event = "file_opened",
            handler = function(file_path)
            -- auto close
            -- vimc.cmd("Neotree close")
            -- OR
            require("neo-tree.command").execute({ action = "close" })
            end
          },
        }
      })
    }
    '';

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
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "<leader>b";  # this line is changed
        mode = "n";
        options = {
          desc = "Toggle Tree View.";
        }; 
      }
    ];
  };
}