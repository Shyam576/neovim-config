local api = vim.api
api.nvim_create_autocmd({'InsertEnter'},{ command = 'set norelativenumber' })
api.nvim_create_autocmd({'InsertLeave'},{ command = 'set relativenumber' })

api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.rs','*.js','*.ts','*.lua','*.py','*.json' },
  callback = function() pcall(vim.lsp.buf.format, { timeout_ms = 2000 }) end,
})

-- Restore cursor to last position when reopening a file
api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})