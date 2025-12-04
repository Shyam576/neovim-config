local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Reduce or increase window size
map("n", "<leader>=", "<C-w>>", opts)
map("n", "<leader>-", "<C-w><", opts)

map('n', '<leader>h', ':bp<CR>', opts)
map('n', '<leader>l', ':bn<CR>', opts)
map('n', '<leader>bd', ':Bdelete<CR>', opts)

-- Clear search highlighting
map('n', '<Esc>', ':nohlsearch<CR>', opts)
map('n', '<leader>nh', ':nohlsearch<CR>', opts)

-- Telescope keymaps (lazy-loaded)
map('n', '<leader>ff', function() require('telescope.builtin').find_files() end, opts)
map('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, opts)
map('n', '<leader>fb', function() require('telescope.builtin').buffers() end, opts)

map('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts)
map('t', '<Esc>', '<C-\\><C-n>', opts)

-- Harpoon keymaps
map('n', '<leader>a', function() require('harpoon'):list():add() end, opts)
map('n', '<C-e>', function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end, opts)
map('n', '<C-1>', function() require('harpoon'):list():select(1) end, opts)
map('n', '<C-2>', function() require('harpoon'):list():select(2) end, opts)
map('n', '<C-3>', function() require('harpoon'):list():select(3) end, opts)
map('n', '<C-4>', function() require('harpoon'):list():select(4) end, opts)


--- open and close terminals
map('n', '<leader>t1', '<cmd>1ToggleTerm<CR>', opts)
map('n', '<leader>t2', '<cmd>2ToggleTerm<CR>', opts)
map('n', '<leader>t3', '<cmd>3ToggleTerm<CR>', opts)
map('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', opts)   -- Floating terminal
map('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>', opts) -- Horizontal split
map('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<CR>', opts) -- Vertical split

map('n', '<leader>sv', ':vsplit<CR>', opts)
map('n', '<leader>sh', ':split<CR>', opts)
map('n', '<leader>sx', ':close<CR>', opts)
map('n', '<leader>se', '<C-w>=', opts)

-- map('n', '<leader>a', '<cmd>AerialToggle<CR>', opts)     -- Toggle outline
-- map('n', '<leader>ao', '<cmd>AerialOpen<CR>', opts)      -- Open outline
-- map('n', '<leader>ac', '<cmd>AerialClose<CR>', opts)     -- Close outline
-- map('n', '<leader>an', '<cmd>AerialNavToggle<CR>', opts) -- Toggle floating nav

