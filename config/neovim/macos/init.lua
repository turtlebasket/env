-- aliases

local o = vim.o
local c = vim.cmd
local map = vim.api.nvim_set_keymap

-- options

o.termguicolors = true
o.mouse = 'a'
o.autoindent = true
o.wrap = true
o.nobinary = true
o.relativenumber = true
o.tabstop = 4
o.shiftwidth = 4
c.colorscheme 'catppuccin'

-- keybinds

-- file management
map('n', '<c-t>', ':CHADopen<cr>', {silent = true})

map('n', '<c-`>', ':ToggleTerm<cr>', {silent = true})
-- exit terminal requires <Cmd> prefix
map('t', '<c-`>', '<Cmd>:ToggleTerm<cr>', {silent = true}) 

map('n', '<Space>gs', ':Telescope git_status<cr>', {silent = true})
map('n', '<Space>gc', ':Telescope git_commits<cr>', {silent = true})
map('n', '<Space><Space>', ':Telescope find_files<cr>', {silent = true})

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

	-- Editor
	use {'neovim/nvim-lspconfig', config = function()
		local lspc = require('lspconfig')
		lspc['pyright'].setup{}
		lspc['tsserver'].setup{}
		lspc['rust-analyzer'].setup{}
	end}
	use {'ms-jpq/chadtree', branch = 'chad'}
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup()
	end}
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function()
		vim.cmd[[TSEnable highlight]]
	end}

end)

