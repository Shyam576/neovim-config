require('nvim-treesitter.configs').setup{
  ensure_installed = {'lua','rust','go','gomod','gosum','gowork','javascript','typescript','python','html','css','json','bash','markdown','markdown_inline'},
  highlight = { enable = true },
  incremental_selection = { enable = true },
}
