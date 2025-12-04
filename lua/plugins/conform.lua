require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'black', 'isort' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescriptreact = { 'prettier' },
    json = { 'prettier' },
    yaml = { 'prettier' },
    markdown = { 'prettier' },
    html = { 'prettier' },
    css = { 'prettier' },
    rust = { 'rustfmt' },
  },
  format_on_save = {
    timeout_ms = 2000,
    lsp_fallback = true,
  },
})
