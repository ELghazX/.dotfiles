vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- File operations
map('n', '<C-s>', '<cmd>w<CR>', opts)
map('n', '<leader>sn', '<cmd>noautocmd w<CR>', opts)
map('n', '<C-q>', '<cmd>q<CR>', opts)

-- Better editing
map('n', 'x', '"_x', opts)
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)

-- Window resizing
map('n', '<Up>', ':resize -2<CR>', opts)
map('n', '<Down>', ':resize +2<CR>', opts)
map('n', '<Left>', ':vertical resize -2<CR>', opts)
map('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffer navigation
map('n', '<S-l>', ':bnext<CR>', opts)
map('n', '<S-h>', ':bprevious<CR>', opts)
map('n', '<leader>bd', ':bdelete!<CR>', opts)
map('n', '<leader>bn', '<cmd>enew<CR>', opts)

-- Window management
map('n', '<leader>sv', '<C-w>v', opts)
map('n', '<leader>ss', '<C-w>s', opts)
map('n', '<leader>se', '<C-w>=', opts)
map('n', '<leader>sd', ':close<CR>', opts)

-- Window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Tab management
map('n', '<leader>to', ':tabnew<CR>', opts)
map('n', '<leader>tx', ':tabclose<CR>', opts)
map('n', '<leader>tn', ':tabn<CR>', opts)
map('n', '<leader>tp', ':tabp<CR>', opts)

-- Visual mode improvements
map('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)
map('v', 'p', '"_dP', opts)

-- Diagnostics
map('n', '[d', function() vim.diagnostic.jump { count = -1, float = true } end, { desc = 'Previous diagnostic' })
map('n', ']d', function() vim.diagnostic.jump { count = 1, float = true } end, { desc = 'Next diagnostic' })
map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open diagnostic float' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
