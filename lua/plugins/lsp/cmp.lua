local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ 
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
  }),
  
  -- Window styling for better visibility
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  
  sources = cmp.config.sources({
    { 
      name = 'nvim_lsp',
      priority = 10,
      entry_filter = function(entry, ctx)
        -- Show auto-import suggestions
        return true
      end,
    },
    { name = 'luasnip', priority = 8 },
    { name = 'buffer', priority = 7, keyword_length = 3 },
    { name = 'path', priority = 5 },
  }),
  
  formatting = {
    format = function(entry, vim_item)
      -- Add icon for auto-import items
      local completion_item = entry:get_completion_item()
      if completion_item.labelDetails then
        vim_item.menu = completion_item.labelDetails.description or vim_item.menu
      end
      
      -- Show source and indicate auto-imports
      local source_name = ({
        nvim_lsp = '[LSP]',
        luasnip = '[Snip]',
        buffer = '[Buf]',
        path = '[Path]',
      })[entry.source.name] or ''
      
      -- Add indicator if this completion will auto-import
      if completion_item.additionalTextEdits or 
         (completion_item.labelDetails and completion_item.labelDetails.detail) then
        vim_item.menu = source_name .. ' 󰳛'  -- icon indicating auto-import
      else
        vim_item.menu = source_name
      end
      
      return vim_item
    end,
  },
  
  experimental = {
    ghost_text = true, -- Show preview of completion
  },
})
