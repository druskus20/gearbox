{
  lib,
  pkgs,
  ...
} @ inputs: {
  home-manager.users.drusk = {
    home.sessionVariables = {
      EDITOR = "nvim";
    };

    programs.neovim = let
      leader = ",";
    in {
      enable = true;
      plugins = let
        buildPlugin = name:
          pkgs.vimUtils.buildNeovimPluginFrom2Nix {
            inherit name;
            src = inputs."${name}";
          };
        buildPlugins = names: lib.attrsets.genAttrs names buildPlugin;
        plugins = buildPlugins [
          "cmp-conventionalcommits"
          "cmp-git"
          "lsp-trouble"
        ];
      in
        with pkgs.vimPlugins;
        with plugins; [
          {plugin = cmp-buffer;}
          {plugin = cmp-calc;}
          {plugin = cmp-conventionalcommits;}
          {plugin = cmp-latex-symbols;}
          {plugin = cmp-nvim-lsp;}
          {plugin = cmp-path;}
          {plugin = cmp-treesitter;}
          {plugin = cmp-vsnip;}
          {plugin = lsp-trouble;}
          {plugin = rust-vim;}
          {
            plugin = cmp-git;
            config = "lua require 'cmp_git'.setup()";
          }
          {
            plugin = gitsigns-nvim;
            config = ''
              lua require 'gitsigns'.setup()
              set signcolumn=yes
            '';
          }
          {
            plugin = lightline-vim;
            config = ''
              let g:lightline = { 'colorscheme': 'solarized' }
              set noshowmode
            '';
          }
          {
            plugin = lspsaga-nvim;
            config = ''
              lua require 'lspsaga'.init_lsp_saga()
              nnoremap <silent> ${leader}a :Lspsaga code_action<cr>
              nnoremap <silent> ${leader}r :Lspsaga rename<cr>
              nnoremap <silent> gd :lua vim.lsp.buf.definition()<cr>
              nnoremap <silent> gD :lua vim.lsp.buf.declaration()<cr>
            '';
          }
          {
            plugin = NeoSolarized;
            config = ''
              set background=light
              colorscheme NeoSolarized
            '';
          }
          {
            plugin = nvim-cmp;
            config = ''
              set completeopt=menu,menuone,noselect
              lua <<EOF
                local cmp = require 'cmp'
                cmp.setup {
                  snippet = {
                    expand = function(args)
                      vim.fn["vsnip#anonymous"](args.body)
                    end,
                  },
                  window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                  },
                  mapping = {
                    ['<c-space>'] = cmp.mapping.confirm({ select = true }),
                    ['<c-p>']     = cmp.mapping.select_prev_item(select_opts),
                    ['<c-n>']     = cmp.mapping.select_next_item(select_opts),
                    ['<c-d>']     = cmp.mapping.scroll_docs(4),
                    ['<c-u>']     = cmp.mapping.scroll_docs(-4),
                    ['<c-e>']     = cmp.mapping.abort(),
                  },
                  sources = cmp.config.sources {
                    { name = 'buffer' },
                    { name = 'calc' },
                    { name = 'conventionalcommits' },
                    { name = 'crates' },
                    { name = 'git' },
                    { name = 'latex_symbols' },
                    { name = 'nvim_lsp' },
                    { name = 'path' },
                    { name = 'treesitter' },
                    { name = 'vsnip' },
                  },
                }
              EOF
            '';
          }

          {
            plugin = nvim-lspconfig;
            config = let
              configure = srv: ''
                lspconfig.${srv}.setup {
                  capabilities = caps,
                }
              '';
              servers = [
                "clangd"
                "gopls"
                "rust_analyzer"
              ];
              serverConfigs = lib.strings.concatStringsSep "\n" (builtins.map configure servers);
            in ''
              lua <<EOF
                local lspconfig = require 'lspconfig'
                local caps = require 'cmp_nvim_lsp'.update_capabilities(
                  vim.lsp.protocol.make_client_capabilities()
                )
                ${serverConfigs}
              EOF
            '';
          }

          {
            plugin = telescope-nvim;
            config = ''
              nnoremap <silent> ${leader}f :Telescope find_files<cr>
              nnoremap <silent> ${leader}g :Telescope live_grep<cr>
              nnoremap <silent> ${leader}b :Telescope buffers<cr>
              nnoremap <silent> ${leader}: :Telescope commands<cr>
            '';
          }
        ];

      extraConfig = let
        theme = import ../theme.nix;
      in ''
        " keybinds
        let mapleader = "${leader}"
        let g:mapleader = "${leader}"
        inoremap kj <esc>
        vnoremap < <gv
        vnoremap > >gv
        nnoremap <c-h> <c-w>h
        nnoremap <c-j> <c-w>j
        nnoremap <c-k> <c-w>k
        nnoremap <c-l> <c-w>l
        nnoremap <leader>s :w<cr>
        " misc
        set termguicolors
        set mouse=a
        set undofile
        set hidden
        set encoding=utf-8
        set hlsearch
        set incsearch
        set ignorecase
        set smartcase
        set lazyredraw
        set splitbelow
        set splitright
        set matchtime=2
        set showmatch
        set wrap
        set breakindent
        set nowritebackup
        set updatetime=250
        set colorcolumn=+1
        set cursorline
        set shiftwidth=4
        set tabstop=4
        set expandtab
        set shiftround
        set autoindent
        set smartindent
        highlight! ExtraWhitespace guibg=${theme.normal.red}
        match ExtraWhitespace /\s\+$/
      '';
    };
  };
}
