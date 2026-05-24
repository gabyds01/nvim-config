require('gitsigns').setup({
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'rounded',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  
  -- Keymaps
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navegación rápida entre cambios (hunks)
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true, desc = "Siguiente cambio Git"})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true, desc = "Anterior cambio Git"})

    -- Acciones rápidas de Git
    map('n', '<leader>hs', gs.stage_hunk, { desc = "Stage hunk de Git" })
    map('n', '<leader>hr', gs.reset_hunk, { desc = "Reset hunk de Git" })
    map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Stage seleccion de Git" })
    map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Reset seleccion de Git" })
    map('n', '<leader>hS', gs.stage_buffer, { desc = "Stage buffer completo" })
    map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "Deshacer stage de hunk" })
    map('n', '<leader>hR', gs.reset_buffer, { desc = "Reset buffer completo" })
    map('n', '<leader>hp', gs.preview_hunk, { desc = "Previsualizar diff de hunk inline" })
    map('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = "Git blame de linea actual" })
    map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = "Alternar inline blame" })
    map('n', '<leader>hd', gs.diffthis, { desc = "Diff de Git contra HEAD" })
    map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "Diff contra commit anterior" })
  end
})
