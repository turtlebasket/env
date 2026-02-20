-- INSTALL LAZY.NVIM (if not bootstrapping automatically):
-- git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable \
--   ~/.local/share/nvim/lazy/lazy.nvim

if vim.g.vscode then
  return
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = vim.opt
opt.termguicolors = true
opt.mouse = 'a'
opt.smartindent = true
opt.wrap = false
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

vim.hl.priorities.semantic_tokens = 140
vim.hl.priorities.treesitter = 100

vim.filetype.add({ extension = { svelte = 'svelte' } })
vim.api.nvim_create_autocmd('FileType', { pattern = 'markdown', command = 'setlocal wrap' })

local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent = true })
end

for _, m in ipairs({
  { 'n', '<c-b>', '<cmd>NvimTreeToggle<cr>' },
  { 'n', '<c-`>', '<cmd>ToggleTerm direction="float"<cr>' },
  { 't', '<c-`>', '<cmd>ToggleTerm<cr>' },
  { 'n', '<leader>gs', '<cmd>Telescope git_status<cr>' },
  { 'n', '<leader>gc', '<cmd>Telescope git_commits<cr>' },
  { 'n', '<leader>:', '<cmd>Telescope commands<cr>' },
  { 'n', '<leader><leader>', '<cmd>Telescope find_files<cr>' },
  { 'n', '<leader>f', '<cmd>Telescope grep_string<cr>' },
  { 'n', '<leader>b', '<cmd>Telescope buffers<cr>' },
  { 'n', 'B', '<cmd>Telescope buffers<cr>' },
  { 'n', '<leader>e', vim.diagnostic.open_float },
  { 'n', '\\', vim.lsp.buf.hover },
  { 'n', '<a-k>', '<cmd>GitGutterPrevHunk<cr>' },
  { 'n', '<a-j>', '<cmd>GitGutterNextHunk<cr>' },
  { 'n', '<c-h>', '<cmd>bp<cr>' },
  { 'n', '<c-l>', '<cmd>bn<cr>' },
}) do
  map(m[1], m[2], m[3])
end

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
    config = function() require('vscode').setup({ transparent = true }) end,
  },
  { 'airblade/vim-gitgutter' },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() require('lualine').setup({ options = { theme = 'vscode', globalstatus = true } }) end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local wanted = { 'svelte', 'javascript', 'typescript', 'html', 'css' }
      local ts_runtime = vim.fn.stdpath('data') .. '/lazy/nvim-treesitter/runtime'
      if vim.loop.fs_stat(ts_runtime) then
        vim.opt.rtp:append(ts_runtime)
      end
      require('nvim-treesitter').setup({ install_dir = vim.fn.stdpath('data') .. '/site' })

      vim.api.nvim_create_autocmd('FileType', {
        pattern = wanted,
        callback = function() pcall(vim.treesitter.start) end,
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local capabilities = vim.tbl_deep_extend(
        'force',
        vim.lsp.protocol.make_client_capabilities(),
        require('cmp_nvim_lsp').default_capabilities()
      )

      local function on_attach(client, bufnr)
        if client.server_capabilities.semanticTokensProvider then
          vim.lsp.semantic_tokens.start(bufnr, client.id)
        end
      end

      local defaults = {
        capabilities = capabilities,
        on_attach = on_attach,
      }
      local servers = {
        basedpyright = {},
        ts_ls = {},
        svelte = {},
        rust_analyzer = {},
      }

      for server, opts in pairs(servers) do
        vim.lsp.config(server, vim.tbl_deep_extend('force', defaults, opts))
        vim.lsp.enable(server)
      end
    end,
  },
  { 'hrsh7th/cmp-nvim-lsp' },
  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        mapping = {
          ['<C-n>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
              cmp.complete()
            end
          end, { 'i', 's' }),
          ['<C-p>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            end
          end, { 'i', 's' }),
          ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = { { name = 'nvim_lsp' } },
      })
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() require('nvim-tree').setup({ view = { width = 42 } }) end,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim' },
    config = function()
      local actions = require('telescope.actions')
      require('telescope').setup({
        defaults = {
          mappings = {
            i = {
              ['<Esc>'] = actions.close,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
        },
      })
      require('telescope').load_extension('fzf')
    end,
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function() require('toggleterm').setup() end,
  },
})

if not pcall(vim.cmd.colorscheme, 'vscode') then
  print('Failed to load colorscheme - probably has not been installed')
end
