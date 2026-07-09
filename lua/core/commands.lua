-- Reload core config (options, keymaps, autocmds) without restarting Neovim.
-- Clears cached Lua modules first since plain :source won't pick up
-- changes to files that were already require()'d.
--
-- Plugin specs are intentionally excluded: lazy.nvim's setup() cannot be
-- safely re-run, so plugin spec changes still require a restart.
vim.api.nvim_create_user_command('ReloadConfig', function()
  for name, _ in pairs(package.loaded) do
    if name:match('^core') then
      package.loaded[name] = nil
    end
  end

  require('core.options')
  require('core.keymaps')
  require('core.autocmds')
  require('core.commands')

  vim.notify('Core config reloaded (restart Neovim for plugin spec changes)', vim.log.levels.INFO)
end, {})
