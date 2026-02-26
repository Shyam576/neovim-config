local chat = require('CopilotChat')

chat.setup({
  model = 'claude-sonnet-4.6', -- must support function calling for file editing; run :CopilotChatModels to list options
  agent = 'editor',  -- default agent; gives Copilot file read/write tools
  window = {
    layout = 'float', -- float used as fallback for quick actions; <leader>cc uses a manual split
  },
  mappings = {
    reset = { normal = '<C-r>', insert = '<C-r>' },
    submit_prompt = { normal = '<CR>', insert = '<C-s>' },
  },
})

local map = vim.keymap.set

-- Toggle: open in a persistent right split, or focus it if already open
local function open_chat_split()
  -- If chat window already exists, just focus it
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype == 'copilot-chat' then
      vim.api.nvim_set_current_win(win)
      return
    end
  end
  -- Open a right-side split, then render chat inside it
  vim.cmd('botright vsplit')
  chat.open({ window = { layout = 'replace' } })
end

local function close_chat_split()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype == 'copilot-chat' then
      vim.api.nvim_win_close(win, true)
      return
    end
  end
end

map('n', '<leader>cc', open_chat_split,  { desc = 'Copilot Chat open/focus' })
map('v', '<leader>cc', open_chat_split,  { desc = 'Copilot Chat open/focus (selection)' })
map('n', '<leader>cx', close_chat_split, { desc = 'Copilot Chat close' })
map('n', '<leader>cr', '<cmd>CopilotChatReset<CR>', { desc = 'Copilot Chat reset' })

-- Quick actions
map('n', '<leader>ce', '<cmd>CopilotChatExplain<CR>',    { desc = 'Copilot: explain' })
map('v', '<leader>ce', '<cmd>CopilotChatExplain<CR>',    { desc = 'Copilot: explain selection' })
map('n', '<leader>cf', '<cmd>CopilotChatFix<CR>',        { desc = 'Copilot: fix' })
map('v', '<leader>cf', '<cmd>CopilotChatFix<CR>',        { desc = 'Copilot: fix selection' })
map('n', '<leader>ct', '<cmd>CopilotChatTests<CR>',      { desc = 'Copilot: generate tests' })
map('v', '<leader>ct', '<cmd>CopilotChatTests<CR>',      { desc = 'Copilot: generate tests for selection' })
map('n', '<leader>co', '<cmd>CopilotChatOptimize<CR>',   { desc = 'Copilot: optimize' })
map('v', '<leader>co', '<cmd>CopilotChatOptimize<CR>',   { desc = 'Copilot: optimize selection' })
map('n', '<leader>cd', '<cmd>CopilotChatDocs<CR>',       { desc = 'Copilot: add docs' })
map('v', '<leader>cd', '<cmd>CopilotChatDocs<CR>',       { desc = 'Copilot: add docs for selection' })

-- Inline prompt
map('n', '<leader>ci', function()
  local input = vim.fn.input('Ask Copilot: ')
  if input ~= '' then chat.ask(input) end
end, { desc = 'Copilot: inline prompt' })
