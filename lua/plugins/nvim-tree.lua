require('nvim-tree').setup({
  filters = {
    dotfiles = false, -- Show dotfiles like .env, .gitignore, etc.
    custom = {},
  },
  git = {
    enable = true,
    ignore = false, -- Show files that are gitignored
  },
  view = {
    width = 15,
    side = 'left',
    number = true,
    relativenumber = true,
    preserve_window_proportions = true, -- Keep nvim-tree width when opening/closing buffers
    float = {
      enable = true,
    },
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },
  actions = {
    open_file = {
      resize_window = false, -- Don't resize nvim-tree when opening files
      window_picker = {
        enable = true,
      },
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  on_attach = function(bufnr)
    local api = require('nvim-tree.api')
    
    -- Default mappings
    api.config.mappings.default_on_attach(bufnr)
    
    -- Custom keymaps for nvim-tree buffer
    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    
    -- Quick resize keymaps when in nvim-tree
    vim.keymap.set('n', '<C-=>', '<cmd>NvimTreeResize +5<CR>', opts('Increase width'))
    vim.keymap.set('n', '<C-->', '<cmd>NvimTreeResize -5<CR>', opts('Decrease width'))
    vim.keymap.set('n', '<C-0>', '<cmd>NvimTreeResize 30<CR>', opts('Reset to default width'))
  end,
})
