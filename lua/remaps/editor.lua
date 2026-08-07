vim.g.mapleader = " "


-- Autocomplete braces and inverted commas
-- vim.keymap.set('i', '{', '{}<Esc>ha')
-- vim.keymap.set('i', '(', '()<Esc>ha')
-- vim.keymap.set('i', '[', '[]<Esc>ha')
-- vim.keymap.set('i', '\"', '\"\"<Esc>ha')
-- vim.keymap.set('i', '\'', '\'\'<Esc>ha')
-- vim.keymap.set('i', '`', '``<Esc>ha')

local opts = {silent = true, remap = false}

-- Buffer and file manipulations
vim.keymap.set('n', '<leader>t', ':b#<CR>', opts)
vim.keymap.set('n', '<leader><Tab>', ':bn<CR>', opts)
vim.keymap.set('n', '<leader>n', ':ene<CR>', opts)
vim.keymap.set('n', '<leader>q', ':bd<CR>', opts)
vim.keymap.set('n', '<leader>w', ':w<CR>', opts)
vim.keymap.set('n', '<leader>e', ':Ex<CR>', opts)
vim.keymap.set('n', '<leader>z', ':q<CR>', opts)


-- Remove highlight by 2x Esc
vim.keymap.set('n', '<Esc><Esc>', ':noh<CR>', opts)


-- Scrolling with centering
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')


-- show the opened buffers
vim.keymap.set('n', '<leader>ll', ':ls<CR>', opts)


-- capture selection within "" 
vim.keymap.set('n', '<leader>cc', 'ciw""<Esc>P')


-- use esc to come to normal mode in terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n><CR>')

-- file path completion remap
vim.keymap.set("i", "<C-F>", "<C-X><C-F>", opts)
