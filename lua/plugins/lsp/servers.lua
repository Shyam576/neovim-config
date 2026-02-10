local M = {}
function M.setup(opts)
  local servers = { 'lua_ls','ts_ls','eslint','rust_analyzer','html','jsonls' }
  
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
  
    -- Server-specific settings and FILETYPES (critical!)
    if server_name == 'lua_ls' then
      cfg.filetypes = { 'lua' }
      cfg.root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git' }
      cfg.settings = {
        Lua = {
          diagnostics = { globals = {'vim'} },
          workspace = { checkThirdParty = false }
        }
      }
    elseif server_name == 'ts_ls' then
      cfg.filetypes = { 
        'javascript', 'javascriptreact', 'javascript.jsx',
        'typescript', 'typescriptreact', 'typescript.tsx'
      }
      cfg.root_markers = { 'tsconfig.json', 'package.json', 'jsconfig.json', '.git' }
      cfg.settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = 'all',
          },
          suggest = {
            includeCompletionsForModuleExports = true,
            includeAutomaticOptionalChainCompletions = true,
            includeCompletionsForImportStatements = true,
          },
          preferences = {
            importModuleSpecifier = 'relative',
            includePackageJsonAutoImports = 'auto',
            quoteStyle = 'single',
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = 'all',
          },
          suggest = {
            includeCompletionsForModuleExports = true,
            includeAutomaticOptionalChainCompletions = true,
            includeCompletionsForImportStatements = true,
          },
          preferences = {
            importModuleSpecifier = 'relative',
            quoteStyle = 'single',
          },
        },
      }
      cfg.init_options = {
        preferences = {
          disableSuggestions = false,
          includeCompletionsForModuleExports = true,
          includeCompletionsWithInsertText = true,
          includeAutomaticOptionalChainCompletions = true,
          includeCompletionsForImportStatements = true,
          importModuleSpecifierPreference = 'relative',
          quotePreference = 'single',
        },
      }
    elseif server_name == 'eslint' then
      cfg.filetypes = { 
        'javascript', 'javascriptreact', 'javascript.jsx',
        'typescript', 'typescriptreact', 'typescript.tsx',
        'vue', 'svelte', 'astro'
      }
      cfg.root_markers = { '.eslintrc', '.eslintrc.js', '.eslintrc.json', '.eslintrc.cjs', 'eslint.config.js', 'package.json' }
      cfg.settings = {
        validate = 'on',
        packageManager = 'npm',
        useESLintClass = false,
        experimental = {
          useFlatConfig = false,
        },
        codeAction = {
          disableRuleComment = {
            enable = true,
            location = "separateLine"
          },
          showDocumentation = {
            enable = true
          }
        },
        codeActionOnSave = {
          mode = "all",
          rules = nil,
        },
        format = false,
        quiet = false,
        onIgnoredFiles = 'off',
        rulesCustomizations = {},
        run = 'onType',
        problems = {
          shortenToSingleLine = false,
        },
        nodePath = '',
        workingDirectory = {
          mode = 'auto',
        },
      }
    elseif server_name == 'rust_analyzer' then
      cfg.filetypes = { 'rust' }
      cfg.root_markers = { 'Cargo.toml', 'rust-project.json' }
    elseif server_name == 'html' then
      cfg.filetypes = { 'html', 'templ' }
      cfg.root_markers = { 'package.json', '.git' }
    elseif server_name == 'jsonls' then
      cfg.filetypes = { 'json', 'jsonc' }
      cfg.root_markers = { '.git' }
    end
    
    -- Use native Neovim 0.11+ LSP API
    vim.lsp.config(server_name, cfg)
  end
  
  -- Enable all configured servers
  vim.lsp.enable(servers)
end
return M
