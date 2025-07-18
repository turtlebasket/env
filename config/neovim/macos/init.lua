-- INSTALL PACKER:
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim\
--     ~/.local/share/nvim/site/pack/packer/start/packer.nvim

-- check for vscode nvim plugin
-- (https://github.com/vscode-neovim/vscode-neovim)
if vim.g.vscode then
    do return end
else
    if vim.g.neovide then
        vim.o.guifont = "CaskaydiaCove Nerd Font:h14"
        vim.g.neovide_hide_mouse_when_typing = true
    end
end

-- aliases

local o = vim.o
local c = vim.cmd
local map = vim.api.nvim_set_keymap

-- options

o.termguicolors = true
o.mouse = 'a'
-- o.autoindent = true
o.smartindent = true -- replacing autoindent with this
o.wrap = false
o.nobinary = true
o.relativenumber = true
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true

-- set wrap if markdown file
vim.cmd('autocmd FileType markdown setlocal wrap')

-- NOTE: pcall prevents plugin system from shitting itself on first load
if not pcall(function() 
    -- c.colorscheme 'catppuccin' 
    c.colorscheme "vscode"
end) then
    print("Failed to load colorscheme - probably has not been installed")
end

-- keybinds

-- file management
-- map('n', '<c-t>', ':CHADopen<cr>', {silent = true})
map('n', '<c-b>', ':NvimTreeToggle<cr>', {silent = true})

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
        -- lspc['pyright'].setup{}
        -- lspc['tsserver'].setup{}
        -- lspc['clojure_lsp'].setup{}
        -- lspc['racket_langserver'].setup{}
        -- lspc['rust_analyzer'].setup{}
        -- lspc['gopls'].setup{}
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

    use {"nvim-tree/nvim-tree.lua"}
    use {"nvim-tree/nvim-web-devicons"}
    require("nvim-tree").setup()

    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use {"akinsho/toggleterm.nvim", tag = '*'}
    require("toggleterm").setup()
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function()
        require'nvim-treesitter.configs'.setup{
            highlight = {enable = true}
        }
    end}

    -- vscode theme
    use 'Mofiqul/vscode.nvim'

    -- NOTE: requires Node.js >= 17
    -- use {'github/copilot.vim', run = ':Copilot setup'}


    -- Specify Filetype for .python Files
    -- vim.api.nvim_exec([[
    --   autocmd BufNewFile,BufRead *.sage set filetype=python
    -- ]], false)

end)


