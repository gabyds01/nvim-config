local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true }) -- Seleccionar primera opción
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<Down>'] = cmp.mapping.select_next_item(),
    ['<Up>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  experimental = { ghost_text = false },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})


local lsp_servers = {
  'bash',
  'json',
  'lua',
  'pyright',
  'hls',
  'clangd',
  'rust_analyzer',
}


local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
vim.lsp.config('*', {
  capabilities = lsp_capabilities,
})

local function on_attach(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>e', function()
    vim.diagnostic.open_float(nil, { focusable = true })
  end, bufopts)
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    on_attach(client, bufnr)
  end,
})


vim.lsp.config('lua', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.config('bash', {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'sh', 'bash' },
})

vim.lsp.config('json', {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json' },
})

vim.lsp.config('pyright', {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  settings = {
    python = { analysis = { autoSearchPaths = true, useLibraryCodeForTypes = true, diagnosticMode = 'openFilesOnly' } },
  },
})


vim.lsp.config('hls', {
  cmd = { 'haskell-langserver', '--stdio' },
  filetypes = { 'haskell' }
})

vim.lsp.config('clangd', {
  cmd = {
    'clangd',
    '--query-driver=/**/*',
  },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
})


vim.lsp.config('rust_analyzer', {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
})

vim.lsp.enable(lsp_servers)


vim.o.signcolumn = 'yes'
vim.diagnostic.config({ virtual_text = false, underline = true })

vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})

vim.cmd [[
  augroup lsp_document_highlight
    autocmd!
    autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved * lua vim.lsp.buf.clear_references()
  augroup END
]]
