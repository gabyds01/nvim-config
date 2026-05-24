vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
vim.keymap.set('n',             'S', '<Plug>(leap-from-window)')

-- Open nvimtree
vim.api.nvim_set_keymap('n', '<Leader>nt', ':NvimTreeToggle<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>nf', ':NvimTreeFindFile<CR>', { silent = true })

-- Make window navigation less painful
vim.keymap.set('', '<C-h>', '<C-w>h')
vim.keymap.set('', '<C-j>', '<C-w>j')
vim.keymap.set('', '<C-k>', '<C-w>k')
vim.keymap.set('', '<C-l>', '<C-w>l')

