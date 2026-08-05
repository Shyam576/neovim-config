local api = vim.api
api.nvim_create_autocmd({'InsertEnter'},{ command = 'set norelativenumber' })
api.nvim_create_autocmd({'InsertLeave'},{ command = 'set relativenumber' })

-- Apply ts_ls code actions (add missing imports, organize imports) synchronously
-- before formatting, so saved files match VS Code's codeActionsOnSave behavior.
local function apply_ts_code_action_sync(bufnr, kind, timeout_ms)
  local clients = vim.lsp.get_clients({ bufnr = bufnr, name = 'ts_ls' })
  if #clients == 0 then return end
  local client = clients[1]
  local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
  params.context = { only = { kind }, diagnostics = {} }
  local ok, results = pcall(vim.lsp.buf_request_sync, bufnr, 'textDocument/codeAction', params, timeout_ms or 1000)
  if not ok or not results then return end
  for _, res in pairs(results) do
    for _, action in ipairs(res.result or {}) do
      if action.edit then
        vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding)
      elseif action.command then
        client:request_sync('workspace/executeCommand', action.command, timeout_ms or 1000, bufnr)
      end
    end
  end
end

api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.ts', '*.tsx', '*.js', '*.jsx' },
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    apply_ts_code_action_sync(bufnr, 'source.addMissingImports.ts')
    apply_ts_code_action_sync(bufnr, 'source.organizeImports.ts')
  end,
})

-- Formatting on save is handled by conform.nvim's format_on_save (see plugins/conform.lua),
-- which already falls back to LSP formatting (lsp_fallback = true) for filetypes without
-- a configured formatter. A second vim.lsp.buf.format autocmd here would double-format
-- buffers (e.g. rust_analyzer running after conform's rustfmt) and was removed.

-- Restore cursor to last position when reopening a file
api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})