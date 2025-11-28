require('nvim-treesitter.configs').setup{
  ensure_installed = {'lua','rust','javascript','typescript','python','html','css','json','bash'},
  highlight = { enable = true },
  incremental_selection = { enable = true },
}
