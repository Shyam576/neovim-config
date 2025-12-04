local actions = require('telescope.actions')
require('telescope').setup{
  defaults = { mappings = { i = { ['<esc>'] = actions.close } } },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}

-- Load fzf extension
require('telescope').load_extension('fzf')
