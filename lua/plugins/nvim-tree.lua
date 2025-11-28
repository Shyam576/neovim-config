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
    width = 30,
    side = 'left',
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
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
})
