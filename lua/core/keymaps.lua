local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Reduce or increase window size (by 5 columns for faster resizing)
map("n", "<leader>=", "<cmd>vertical resize +5<CR>", opts)  -- Increase width
map("n", "<leader>-", "<cmd>vertical resize -5<CR>", opts)  -- Decrease width
map("n", "<leader>+", "<cmd>horizontal resize +3<CR>", opts) -- Increase height
map("n", "<leader>_", "<cmd>horizontal resize -3<CR>", opts) -- Decrease height

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


--- open and close terminals with specific IDs (won't disappear, just toggle)
map('n', '<leader>t1', '<cmd>1ToggleTerm direction=horizontal<CR>', opts)  -- Terminal 1 (horizontal)
map('n', '<leader>t2', '<cmd>2ToggleTerm direction=horizontal<CR>', opts)  -- Terminal 2 (horizontal)
map('n', '<leader>t3', '<cmd>3ToggleTerm direction=horizontal<CR>', opts)  -- Terminal 3 (horizontal)
map('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', opts)        -- Floating terminal
map('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>', opts)   -- Horizontal split
map('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<CR>', opts)     -- Vertical split
map('n', '<C-\\>', '<cmd>ToggleTerm<CR>', opts)                             -- Quick toggle with Ctrl+\
map('t', '<C-\\>', '<cmd>ToggleTerm<CR>', opts)                             -- Quick toggle from terminal mode

map('n', '<leader>sv', ':vsplit<CR>', opts)
map('n', '<leader>sh', ':split<CR>', opts)
map('n', '<leader>sx', ':close<CR>', opts)
map('n', '<leader>se', '<C-w>=', opts)

-- map('n', '<leader>a', '<cmd>AerialToggle<CR>', opts)     -- Toggle outline
-- map('n', '<leader>ao', '<cmd>AerialOpen<CR>', opts)      -- Open outline
-- map('n', '<leader>ac', '<cmd>AerialClose<CR>', opts)     -- Close outline
-- map('n', '<leader>an', '<cmd>AerialNavToggle<CR>', opts) -- Toggle floating nav

