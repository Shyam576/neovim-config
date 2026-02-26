require('copilot').setup({
  -- Disable built-in suggestion/panel since copilot-cmp handles completions
  suggestion = { enabled = false },
  panel = { enabled = false },

  filetypes = {
    yaml = true,
    markdown = true,
    help = false,
    gitcommit = true,
    gitrebase = false,
    ['.'] = false,
  },
})
