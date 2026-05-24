vim.g.fzf_layout = { down = '40%' }
vim.g.fzf_preview_window = { 'right,40%', 'ctrl-/' }

-- Fzf to search files mapped to Ctrl+P (ignores .gitignore files)
vim.keymap.set('n', '<C-P>', ':GFiles --cached --others --exclude-standard<CR>', { silent = true })
vim.keymap.set('n', '<C-U>', ':Buffers<CR>', { silent = true })

-- Search text inside project files using Ctrl+T
vim.keymap.set('n', '<C-T>', ':Rg<CR>', { silent = true })

vim.cmd([[
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
]])
