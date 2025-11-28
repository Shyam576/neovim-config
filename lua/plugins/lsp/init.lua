-- Configure diagnostics display
vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
    source = 'if_many',
  },
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

-- Define diagnostic signs
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require('mason').setup()
require('mason-lspconfig').setup()
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Enable auto-import capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { 'documentation', 'detail', 'additionalTextEdits' }
}

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr }
  
  -- Navigation
  vim.keymap.set('n','gd',vim.lsp.buf.definition,opts)
  vim.keymap.set('n','gD',vim.lsp.buf.declaration,opts)
  vim.keymap.set('n','gi',vim.lsp.buf.implementation,opts)
  vim.keymap.set('n','gr',vim.lsp.buf.references,opts)
  vim.keymap.set('n','gt',vim.lsp.buf.type_definition,opts)
  
  -- Documentation & Info
  vim.keymap.set('n','K',vim.lsp.buf.hover,opts)
  vim.keymap.set('n','<C-k>',vim.lsp.buf.signature_help,opts)
  
  -- Code Actions & Refactoring
  vim.keymap.set('n','<leader>rn',vim.lsp.buf.rename,opts)
  vim.keymap.set('n','<leader>ca',vim.lsp.buf.code_action,opts)
  vim.keymap.set('v','<leader>ca',vim.lsp.buf.code_action,opts)
  
  -- Auto-import missing imports
  vim.keymap.set('n','<leader>ai',function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = { 'source.addMissingImports.ts' },
        diagnostics = {},
      },
    })
  end, { buffer = bufnr, desc = 'Add missing imports' })
  
  -- Organize imports
  vim.keymap.set('n','<leader>oi',function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = { 'source.organizeImports.ts' },
        diagnostics = {},
      },
    })
  end, { buffer = bufnr, desc = 'Organize imports' })
  
  -- Remove unused imports
  vim.keymap.set('n','<leader>ri',function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = { 'source.removeUnused.ts' },
        diagnostics = {},
      },
    })
  end, { buffer = bufnr, desc = 'Remove unused imports' })
  
  -- Diagnostic navigation
  vim.keymap.set('n','[d',vim.diagnostic.goto_prev,opts)
  vim.keymap.set('n',']d',vim.diagnostic.goto_next,opts)
  vim.keymap.set('n','<leader>d',vim.diagnostic.open_float,opts)
  vim.keymap.set('n','<leader>dl',vim.diagnostic.setloclist,opts)
  
  -- Enable inlay hints if available (Neovim 0.10+)
  if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
  
  -- Print confirmation that LSP attached
  print(string.format('LSP attached: %s', client.name))
end

require('plugins.lsp.servers').setup({ capabilities = capabilities, on_attach = on_attach })
require('lspsaga').setup({})
