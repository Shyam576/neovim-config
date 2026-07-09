require('gitsigns').setup({
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')
    local opts = { buffer = bufnr, noremap = true, silent = true }

    -- Hunk navigation
    vim.keymap.set('n', ']c', function() gitsigns.nav_hunk('next') end, opts)
    vim.keymap.set('n', '[c', function() gitsigns.nav_hunk('prev') end, opts)

    -- Hunk actions
    vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk, opts)
    vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk, opts)
    vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk, opts)
    vim.keymap.set('n', '<leader>hu', gitsigns.undo_stage_hunk, opts)

    -- Buffer-wide actions
    vim.keymap.set('n', '<leader>hb', gitsigns.toggle_current_line_blame, opts)
    vim.keymap.set('n', '<leader>hd', gitsigns.diffthis, opts)
  end,
})
