-- ToggleTerm configuration for persistent, toggleable terminals
require('toggleterm').setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]], -- Quick toggle with Ctrl+\
  hide_numbers = true,
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true, -- Mappings in insert mode
  terminal_mappings = true, -- Mappings in terminal mode
  persist_size = true,
  persist_mode = true, -- Persist terminal mode (insert/normal)
  direction = 'horizontal', -- Default direction
  close_on_exit = true, -- Close terminal window when process exits
  shell = vim.o.shell,
  auto_scroll = true,
  float_opts = {
    border = 'curved',
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
  winbar = {
    enabled = false,
  },
})

-- Function to set terminal keymap that works in both normal and terminal mode
local function set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- Apply keymaps when terminal is opened
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*toggleterm#*",
  callback = function()
    set_terminal_keymaps()
  end,
})
