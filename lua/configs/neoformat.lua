-- Use formatters from node_modules/.bin (project-local prettier)
vim.g.neoformat_try_node_exe = 1

vim.g.neoformat_enabled_json = { 'prettier' }
vim.g.neoformat_enabled_markdown = { 'prettier' }

-- Format on save
vim.api.nvim_create_augroup('fmt', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'fmt',
  pattern = '*',
  callback = function()
    pcall(vim.cmd, 'undojoin')
    vim.cmd('Neoformat')
  end
})
