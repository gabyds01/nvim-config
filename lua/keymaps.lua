vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
vim.keymap.set('n',             'S', '<Plug>(leap-from-window)')

-- Open nvimtree
vim.api.nvim_set_keymap('n', '<Leader>nt', ':NvimTreeToggle<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>nf', ':NvimTreeFindFile<CR>', { silent = true })

-- Make window navigation less painful (Managed automatically by vim-tmux-navigator)
-- vim.keymap.set('', '<C-h>', '<C-w>h')
-- vim.keymap.set('', '<C-j>', '<C-w>j')
-- vim.keymap.set('', '<C-k>', '<C-w>k')
-- vim.keymap.set('', '<C-l>', '<C-w>l')

-- Guardar rápido con Ctrl + s en todos los modos
vim.keymap.set({'n', 'x', 's'}, '<C-s>', '<cmd>w<cr>', { desc = "Guardar archivo" })
vim.keymap.set('i', '<C-s>', '<esc><cmd>w<cr>gi', { desc = "Guardar y seguir escribiendo" })

-- Cerrar pestaña (buffer) actual sin cerrar Neovim
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = "Cerrar buffer (pestaña) actual" })

