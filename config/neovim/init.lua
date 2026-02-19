-- INSTALL LAZY.NVIM (if not bootstrapping automatically):
-- git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable \
--   ~/.local/share/nvim/lazy/lazy.nvim

-- NOTE: if vscode-neovim is active, exit early for stock behavior.
if vim.g.vscode then
  return
end

-- aliases
local o = vim.o
local c = vim.cmd
local map = vim.api.nvim_set_keymap

-- leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- options
o.termguicolors = true
o.mouse = 'a'
o.smartindent = true
o.wrap = false
o.relativenumber = true
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true

-- Prefer LSP semantic tokens over treesitter captures when both exist.
vim.hl.priorities.semantic_tokens = 140
vim.hl.priorities.treesitter = 100

-- ensure .svelte files are detected correctly
vim.filetype.add({
  extension = {
    svelte = 'svelte',
  },
})

-- set wrap if markdown file
vim.cmd('autocmd FileType markdown setlocal wrap')

-- keybinds
map('n', '<c-b>', ':NvimTreeToggle<cr>', { silent = true })

map('n', '<c-`>', ':ToggleTerm direction="float"<cr>', { silent = true })
map('t', '<c-`>', '<Cmd>:ToggleTerm<cr>', { silent = true })

map('n', '<leader>gs', ':Telescope git_status<cr>', { silent = true })
map('n', '<leader>gc', ':Telescope git_commits<cr>', { silent = true })
map('n', '<leader>:', ':Telescope commands<cr>', { silent = true })
map('n', '<leader><leader>', ':Telescope find_files<cr>', { silent = true })
map('n', '<leader>f', ':Telescope grep_string<cr>', { silent = true })
map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<cr>', { silent = true })

map('n', '<a-k>', ':GitGutterPrevHunk<cr>', { silent = true })
map('n', '<a-j>', ':GitGutterNextHunk<cr>', { silent = true })

-- buffer management
map('n', '<c-h>', ':bp<cr>', { silent = true })
map('n', '<c-l>', ':bn<cr>', { silent = true })

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'Mofiqul/vscode.nvim',
    name = 'vscode',
    priority = 1000,
    lazy = false,
    config = function()
      require('vscode').setup({
        transparent = true,
      })
    end,
  },
  { 'airblade/vim-gitgutter' },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'vscode',
          globalstatus = true,
        },
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local treesitter = require('nvim-treesitter')
      local wanted = { 'svelte', 'javascript', 'typescript', 'html', 'css' }
      treesitter.setup({})

      vim.api.nvim_create_autocmd('FileType', {
        pattern = wanted,
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.lsp.config('pyright', { capabilities = capabilities })
      vim.lsp.config('ts_ls', { capabilities = capabilities })
      vim.lsp.config('svelte', { capabilities = capabilities })
      vim.lsp.config('rust_analyzer', { capabilities = capabilities })

      vim.lsp.enable('pyright')
      vim.lsp.enable('ts_ls')
      vim.lsp.enable('svelte')
      vim.lsp.enable('rust_analyzer')

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.server_capabilities.semanticTokensProvider then
            vim.lsp.semantic_tokens.start(args.buf, client.id)
          end
        end,
      })
    end,
  },
  { 'hrsh7th/cmp-nvim-lsp' },
  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
        },
      })
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup({ view = { width = 42 } })
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup()
    end,
  },
})

-- NOTE: pcall prevents plugin system errors on first load
if not pcall(function()
  c.colorscheme('vscode')
end) then
  print('Failed to load colorscheme - probably has not been installed')
end
