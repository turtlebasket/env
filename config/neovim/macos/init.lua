
-- check for vscode nvim plugin
-- (https://github.com/vscode-neovim/vscode-neovim)
if not vim.g.vscode then

    -- aliases


    local o = vim.o
    local c = vim.cmd
    local map = vim.api.nvim_set_keymap

    -- options

    o.termguicolors = true
    o.mouse = 'a'
    -- o.autoindent = true
    o.smartindent = true -- replacing autoindent with this
    o.wrap = true
    o.nobinary = true
    o.relativenumber = true
    o.tabstop = 4
    o.shiftwidth = 4
    o.expandtab = true

    -- NOTE: pcall prevents plugin system from shitting itself on first load
    if not pcall(function() 
        c.colorscheme 'catppuccin' 
    end) then
        print("Failed to load colorscheme - probably has not been installed")
    end

    -- keybinds

    -- file management
    map('n', '<c-t>', ':CHADopen<cr>', {silent = true})

    map('n', '<c-`>', ':ToggleTerm direction="float"<cr>', {silent = true})
    -- exit terminal requires <Cmd> prefix
    map('t', '<c-`>', '<Cmd>:ToggleTerm<cr>', {silent = true}) 

    map('n', '<Space>gs', ':Telescope git_status<cr>', {silent = true})
    map('n', '<Space>gc', ':Telescope git_commits<cr>', {silent = true})
    map('n', '<Space>:', ':Telescope commands<cr>', {silent = true})
    map('n', '<Space><Space>', ':Telescope find_files<cr>', {silent = true})
    map('n', '<Space>f', ':Telescope grep_string<cr>', {silent = true})

    -- buffer management
    map('n', '<c-h>', ':bp<cr>', {silent = true})
    map('n', '<c-l>', ':bn<cr>', {silent = true})

    -- plugin configs

    vim.g['airline_powerline_fonts'] = 1
    vim.g['airline_theme'] = 'powerlineish'
    vim.g['airline#extensions#tabline#enabled'] = 1
    vim.g['airline#extensions#tabline#fnamemod'] = ':t'

    -- plugin imports

    return require('packer').startup(function(use)

        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        -- Visual 
        use 'vim-airline/vim-airline'
        use 'vim-airline/vim-airline-themes'
        use { "catppuccin/nvim", as = "catppuccin" }
        use 'airblade/vim-gitgutter'

        -- Editor
        use {'neovim/nvim-lspconfig', config = function()
            local lspc = require('lspconfig')
            lspc['pyright'].setup{}
            lspc['tsserver'].setup{}
            lspc['clojure_lsp'].setup{}
            lspc['racket_langserver'].setup{}
            lspc['rust_analyzer'].setup{}
            lspc['gopls'].setup{}
        end}
        use 'hrsh7th/cmp-nvim-lsp'
        use {'hrsh7th/nvim-cmp', config = function()
            local cmp = require 'cmp'
            cmp.setup {
                sources = {
                    { name = 'nvim_lsp' },
                }
            }
        end}

        use {'ms-jpq/chadtree', branch = 'chad'}
        use 'nvim-lua/plenary.nvim'
        use 'nvim-telescope/telescope.nvim'
        use {"akinsho/toggleterm.nvim", tag = '*', config = function()
            require("toggleterm").setup()
        end}
        use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function()
            require'nvim-treesitter.configs'.setup{
                highlight = {enable = true}
            }
        end}

    end)
end

