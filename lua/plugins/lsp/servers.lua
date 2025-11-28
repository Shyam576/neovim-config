local M = {}
function M.setup(opts)
  local servers = { 'lua_ls','ts_ls','rust_analyzer','html','jsonls' }
  
  require('mason-lspconfig').setup({ 
    ensure_installed = servers,
    automatic_installation = true,
  })
  
  -- Setup each server using vim.lsp.config (Neovim 0.11+)
  for _, server_name in ipairs(servers) do
    local cfg = {
      capabilities = opts.capabilities,
      on_attach = opts.on_attach,
    }
  
    -- Server-specific settings
    if server_name == 'lua_ls' then
      cfg.settings = {
        Lua = {
          diagnostics = { globals = {'vim'} },
          workspace = { checkThirdParty = false }
        }
      }
    elseif server_name == 'ts_ls' then
      cfg.settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = 'all',
          },
          suggest = {
            includeCompletionsForModuleExports = true,
          },
          preferences = {
            importModuleSpecifier = 'relative',
            includePackageJsonAutoImports = 'auto',
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = 'all',
          },
          suggest = {
            includeCompletionsForModuleExports = true,
          },
        },
      }
      cfg.init_options = {
        preferences = {
          disableSuggestions = false,
          includeCompletionsForModuleExports = true,
          includeCompletionsWithInsertText = true,
          importModuleSpecifierPreference = 'relative',
        },
      }
    end
    
    -- Use native Neovim 0.11+ LSP API
    vim.lsp.config(server_name, cfg)
  end
  
  -- Enable all configured servers
  vim.lsp.enable(servers)
end
return M
