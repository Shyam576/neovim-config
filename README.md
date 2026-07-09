## 📋 Table of Contents

1. Leader Key
2. Visual Mode
3. File Management
4. Window Navigation
5. Buffer Management
6. Telescope (Fuzzy Finder)
7. LSP Features
8. Git Integration
9. Code Editing
10. Terminal
11. Plugin Management
12. Installed Plugins

---

## Leader Key

**Leader key is set to `Space`**

All shortcuts starting with `<leader>` mean you press `Space` first, then the key combination.

---
### Paragraphs
- `vap` - select A paragraph (including surrounding blank lines)
- `vip` - select INNER paragraph (excluding blank lines)

### Words 
- `viw` - select inner word 
- `vaw` - select a word (including spaces)

### Sentences 
- `vis` - inner sentence 
- `vas` - a sentence 

### Brackets 
- `vi(` - inside parentheses 
- `va(` - around parentheses 

---
## 🗂️ File Management

| Shortcut     | Action        | Description                          |
| ------------ | ------------- | ------------------------------------ |
| `<leader>w`  | Save          | Save current file (`:w`)             |
| `<leader>q`  | Quit          | Quit current window (`:q`)           |
| `<leader>e`  | File Explorer | Toggle NvimTree file explorer        |
| `<leader>ff` | Find Files    | Fuzzy find files in project          |
| `<leader>fg` | Live Grep     | Search text across all files         |
| `<leader>fb` | Find Buffers  | List and switch between open buffers |
### NvimTree Commands (when file explorer is open)

- `a` - Create new file
- `d` - Delete file
- `r` - Rename file
- `x` - Cut file
- `c` - Copy file
- `p` - Paste file
- `R` - Refresh tree
- `H` - Toggle hidden files
- `Enter` - Open file
- `Ctrl-v` - Open in vertical split
- `Ctrl-x` - Open in horizontal split

---

## 🪟 Window Navigation

|Shortcut|Action|Description|
|---|---|---|
|`Ctrl-h`|Left|Move to left window|
|`Ctrl-j`|Down|Move to window below|
|`Ctrl-k`|Up|Move to window above|
|`Ctrl-l`|Right|Move to right window|

### Additional Window Commands

- `:split` or `:sp` - Horizontal split
- `:vsplit` or `:vsp` - Vertical split
- `Ctrl-w =` - Equal window sizes
- `Ctrl-w q` - Close current window

## 📑 Buffer Management

|Shortcut|Action|Description|
|---|---|---|
|`<leader>h`|Previous Buffer|Go to previous buffer (`:bp`)|
|`<leader>l`|Next Buffer|Go to next buffer (`:bn`)|
|`<leader>bd`|Delete Buffer|Close current buffer without closing window|

### Bufferline (Top bar)

- Click on tabs to switch buffers
- Middle click to close buffer
- Shows diagnostics (errors/warnings) in tabs

---

## 🔭 Telescope (Fuzzy Finder)

|Shortcut|Action|Description|
|---|---|---|
|`<leader>ff`|Find Files|Search files by name|
|`<leader>fg`|Live Grep|Search text content in files|
|`<leader>fb`|Buffers|List open buffers|

### Telescope Navigation (when open)

- `Ctrl-n` or `↓` - Next item
- `Ctrl-p` or `↑` - Previous item
- `Enter` - Select item
- `Esc` - Close telescope
- `Ctrl-c` - Close telescope
- `Ctrl-u` - Scroll preview up
- `Ctrl-d` - Scroll preview down
- `Ctrl-x` - Open in horizontal split
- `Ctrl-v` - Open in vertical split

## 🔧 LSP Features (Language Server Protocol)

These work when you're editing code files (JavaScript, TypeScript, Rust, Python, Lua, etc.)

|Shortcut|Action|Description|
|---|---|---|
|`gd`|Go to Definition|Jump to where symbol is defined|
|`K`|Hover|Show documentation/type info|
|`<leader>rn`|Rename|Rename symbol across project|
|`<leader>ca`|Code Action|Show available code actions (fixes)|
|`<leader>f`|Format|Format current file|

### LSP Diagnostics

- `]d` - Next diagnostic (error/warning)
- `[d` - Previous diagnostic
- Errors and warnings show inline and in the left gutter

### Diagnostics List (Trouble)

|Shortcut|Action|Description|
|---|---|---|
|`<leader>xx`|Diagnostics|Toggle project-wide diagnostics list|
|`<leader>xX`|Buffer Diagnostics|Toggle diagnostics list for current buffer only|
|`<leader>xL`|Location List|Toggle the location list in Trouble|
|`<leader>xQ`|Quickfix List|Toggle the quickfix list in Trouble|
|`<leader>cs`|Symbols|Toggle document symbols outline|
|`<leader>cl`|LSP References|Toggle LSP references/definitions list|

### Todo Comments

Highlights `TODO`, `FIXME`, `HACK`, `NOTE` (etc.) comments with icons.

|Shortcut|Action|Description|
|---|---|---|
|`]t`|Next Todo|Jump to next todo comment|
|`[t`|Previous Todo|Jump to previous todo comment|
|`<leader>st`|Search Todos|List all todo comments in Telescope|
|`<leader>xt`|Todos (Trouble)|List all todo comments in Trouble|

### Auto-format on Save

Files are automatically formatted when you save:

- `.rs` (Rust)
- `.js`, `.ts` (JavaScript/TypeScript)
- `.lua` (Lua)
- `.py` (Python)
- `.json` (JSON)


### Folding (nvim-ufo)

Treesitter-based code folding with a nicer fold preview. Files open fully unfolded.

|Shortcut|Action|Description|
|---|---|---|
|`zR`|Open All Folds|Unfold everything in the buffer|
|`zM`|Close All Folds|Fold everything in the buffer|
|`zK`|Peek Fold|Preview a folded region without opening it|

## 🔀 Git Integration

### Gitsigns (Git line changes)

Shows changes in the gutter (left side):

- Green `+` - Added lines
- Blue `~` - Modified lines
- Red `-` - Deleted lines

|Shortcut|Action|Description|
|---|---|---|
|`]c`|Next Hunk|Jump to next changed hunk|
|`[c`|Previous Hunk|Jump to previous changed hunk|
|`<leader>hp`|Preview Hunk|Show hunk diff in a popup|
|`<leader>hs`|Stage Hunk|Stage the hunk under cursor|
|`<leader>hr`|Reset Hunk|Discard changes in the hunk under cursor|
|`<leader>hu`|Undo Stage Hunk|Unstage the last staged hunk|
|`<leader>hb`|Toggle Line Blame|Show/hide inline git blame for current line|
|`<leader>hd`|Diff This|Diff current buffer against the index|

### Diffview (Review all uncommitted changes)

Useful for reviewing everything changed across the repo before committing, e.g. after an AI agent has edited multiple files.

|Shortcut|Action|Description|
|---|---|---|
|`<leader>gd`|Open Diffview|Show a file tree + diff of every changed file|
|`<leader>gc`|Close Diffview|Close the diff view|
|`<leader>gh`|File History|Show commit history for the current file|

### Vim Fugitive Commands

|Command|Action|
|---|---|
|`:Git` or `:G`|Open git status|
|`:Git blame`|Show git blame|
|`:Git diff`|Show differences|
|`:Git commit`|Commit changes|
|`:Git push`|Push to remote|
|`:Git pull`|Pull from remote|


## ✏️ Code Editing

### Auto-completion (nvim-cmp)

- Start typing - suggestions appear automatically
- `Tab` - Select next suggestion
- `Shift-Tab` - Select previous suggestion
- `Enter` - Confirm selection
- `Ctrl-Space` - Manually trigger completion

Sources for completion:

- LSP (language server)
- File paths
- Buffer words
- Snippets

### Comment.nvim

|Shortcut|Action|
|---|---|
|`gcc`|Toggle line comment|
|`gbc`|Toggle block comment|
|`gc` + motion|Comment motion (e.g., `gcap` - comment paragraph)|
|**Visual mode:** `gc`|Comment selection|

### nvim-autopairs

Automatically closes:

- `(` → `()` with cursor in middle
- `{` → `{}`
- `[` → `[]`
- `"` → `""`
- `'` → `''`

### nvim-surround

|Command|Action|Example|
|---|---|---|
|`ys{motion}{char}`|Add surround|`ysiw"` - surround word with `"`|
|`ds{char}`|Delete surround|`ds"` - remove `"` around word|
|`cs{old}{new}`|Change surround|`cs"'` - change `"` to `'`|
|**Visual mode:** `S{char}`|Surround selection|Select text, `S"`|

Examples:

- `ysiw)` - surround word with parentheses
- `yss}` - surround line with braces
- `dst` - delete surrounding HTML tag

### Indent Blankline

Shows vertical lines for indentation levels - helps visualize code structure

## 🖥️ Terminal

|Shortcut|Action|
|---|---|
|`Esc`|Normal mode|

### ToggleTerm Commands

|Command|Action|
|---|---|
|`:ToggleTerm`|Open/close terminal|
|`:TermExec cmd="command"`|Execute command in terminal|

---

## 🚀 Dashboard (alpha-nvim)

Shown on startup when Neovim opens with no file argument.

|Key|Action|
|---|---|
|`f`|Find file|
|`g`|Live grep|
|`r`|Restore session for current directory|
|`l`|Restore last session|
|`n`|New file|
|`q`|Quit|

Also enabled: **mini.animate** (smooth cursor/scroll movement) and **nvim-colorizer.lua** (inline preview of hex/CSS colors) — both work passively with no keymaps needed.

## ⚙️ Config Management

|Shortcut|Command|Description|
|---|---|---|
|`<leader>rc`|`:ReloadConfig`|Reload options, keymaps and autocmds without restarting Neovim (plugin spec changes still need a restart)|

### Sessions (persistence.nvim)

Automatically saves your open buffers/layout per project directory on exit.

|Shortcut|Action|Description|
|---|---|---|
|`<leader>sr`|Restore Session|Restore the session for the current directory|
|`<leader>sl`|Restore Last Session|Restore the most recently saved session (any directory)|
|`<leader>sc`|Select Session|Pick a session to restore from a list|
|`<leader>sd`|Stop Session|Stop saving a session on exit (for this Neovim instance)|

## 📦 Plugin Management (Lazy.nvim)

| Command        | Action                       |
| -------------- | ---------------------------- |
| `:Lazy`        | Open plugin manager UI       |
| `:Lazy sync`   | Install/update/clean plugins |
| `:Lazy update` | Update plugins               |
| `:Lazy clean`  | Remove unused plugins        |
| `:Lazy check`  | Check for updates            |
## 🎨 Installed Plugins

### Theme

- **gruvbox.nvim** - Retro groove color scheme

### File Navigation

- **nvim-tree.lua** - File explorer
- **telescope.nvim** - Fuzzy finder

### LSP & Completion

- **nvim-lspconfig** - LSP configuration
- **mason.nvim** - LSP/tool installer
- **nvim-cmp** - Auto-completion engine
- **LuaSnip** - Snippet engine

### Syntax & Highlighting

- **nvim-treesitter** - Better syntax highlighting

### UI Enhancements

- **lualine.nvim** - Status line (bottom bar)
- **bufferline.nvim** - Buffer tabs (top bar)
- **which-key.nvim** - Shows available keybindings
- **nvim-notify** - Better notifications
- **nvim-web-devicons** - File icons

### Git

- **gitsigns.nvim** - Git decorations in gutter
- **vim-fugitive** - Git commands
- **diffview.nvim** - Full-repo diff review for uncommitted changes

### Code Editing

- **Comment.nvim** - Easy commenting
- **nvim-autopairs** - Auto-close brackets
- **nvim-surround** - Surround text objects
- **indent-blankline.nvim** - Indentation guides

### LSP UI

- **lspsaga.nvim** - Enhanced LSP UI
- **trouble.nvim** - Diagnostics list
- **todo-comments.nvim** - Highlights TODO/FIXME/HACK comments

### Utilities

- **toggleterm.nvim** - Integrated terminal
- **conform.nvim** - Code formatter
- **bufdelete.nvim** - Better buffer deletion
- **persistence.nvim** - Session management

### Folding

- **nvim-ufo** - Treesitter-based code folding with fold preview

### Fun & Polish

- **alpha-nvim** - Startup dashboard
- **mini.animate** - Smooth cursor/scroll animations
- **nvim-colorizer.lua** - Inline hex/CSS color preview

---

## 🎯 Pro Tips

1. **Use Telescope for everything**: `<leader>ff` is your best friend for finding files quickly
    
2. **LSP is powerful**: Press `K` on any function/variable to see documentation
    
3. **Which-key helper**: Press `Space` and wait - it shows all available shortcuts
    
4. **Git in the gutter**: Look left to see what lines you've changed
    
5. **Format on save**: Your code auto-formats when you save - no manual formatting needed
    
6. **Use motions**: `gcc` to comment a line, `gcap` to comment a paragraph
    
7. **Visual block mode**: `Ctrl-v` for column selection (super useful!)
    
8. **Relative numbers**: Line numbers show distance - easy to jump (e.g., `5j` to go down 5 lines)
    
9. **LSP rename**: `<leader>rn` renames across your entire project - very powerful!
    
10. **Clipboard integration**: Copy/paste works with system clipboard
    

---

## 🆘 Getting Help

- `:help {topic}` - Built-in help (e.g., `:help telescope`)
- `:checkhealth` - Diagnose issues
- `:Mason` - Install language servers
- Press `Space` and wait - which-key shows available commands


## 🎓 Learning Path

1. **Week 1**: Learn basic navigation (`hjkl`, `Ctrl-h/j/k/l`)
2. **Week 2**: Master file finding (`<leader>ff`, `<leader>fg`)
3. **Week 3**: Use LSP features (`gd`, `K`, `<leader>rn`)
4. **Week 4**: Explore advanced editing (surround, comments, multi-cursor)
### 📋 New Diagnostic Keybindings:

|Key|Action|
|---|---|
|`]d`|Next error/warning|
|`[d`|Previous error/warning|
|`Space + d`|Show error in popup|
|`Space + dl`|List all errors|
|`K`|Show error details (hover)|

# 📝 Obsidian Note: Neovim Text Objects & Window Management

---

## 1. Splits & Window Management

### Open files in splits

- **Vertical split**
    

`:vs filename :vsplit filename`

- **Horizontal split**
    

`:sp filename :split filename`

- **From NvimTree**
    
    - `v` → vertical split
        
    - `s` → horizontal split
        
    - `t` → new tab
        
- **From Telescope**
    
    - `Ctrl + v` → vertical split
        
    - `Ctrl + s` → horizontal split
        

---

### Navigate between splits

`Ctrl + h → move left Ctrl + j → move down Ctrl + k → move up Ctrl + l → move right`

---

### Resize splits

`Ctrl + w >  → increase width Ctrl + w <  → decrease width Ctrl + w +  → increase height Ctrl + w -  → decrease height`

- Optional custom keymaps in `init.lua`:
    

`vim.keymap.set("n", "<C-Right>", "<C-w>>", opts) vim.keymap.set("n", "<C-Left>", "<C-w><", opts) vim.keymap.set("n", "<C-Up>", "<C-w>+", opts) vim.keymap.set("n", "<C-Down>", "<C-w>-", opts)`

---

### Closing splits & buffers

|Command|Effect|
|---|---|
|`:q` or `<C-w>c`|Close current split (window only)|
|`:bd` or `:bdelete`|Close buffer (file) + split|
|`<C-w>o`|Close all other splits (keep current)|

- Optional keymaps:
    

`vim.keymap.set("n", "<leader>w", "<C-w>c")  -- Close split vim.keymap.set("n", "<leader>q", ":bd<CR>") -- Close buffer`

---

## 2. Text Objects

### Basic commands

|Command|Action|
|---|---|
|`d`|delete|
|`y`|yank (copy)|
|`c`|change (delete + insert)|

---

### Text objects

|Object|`i` = inside|`a` = around|
|---|---|---|
|`w`|word|around word|
|`s`|sentence|around sentence|
|`p`|paragraph|around paragraph|
|`"`|double quotes|include quotes|
|`'`|single quotes|include quotes|
|`(`|parentheses|include parentheses|
|`{`|curly braces|include braces|
|`[`|square brackets|include brackets|
|`<`|angle brackets|include brackets|

---

### Examples

- **Delete inside paragraph**:
    

`dip`

- **Delete around paragraph**:
    

`dap`

- **Delete inside quotes**
    

`di"   -- inside double quotes di'   -- inside single quotes`

- **Delete around quotes**
    

`da"   -- include double quotes da'   -- include single quotes`

- **Delete inside parentheses/braces**
    

`di(   -- inside ( ) di{   -- inside { } di[   -- inside [ ]`

- **Delete around parentheses/braces**
    

`da(   -- include ( ) da{   -- include { } da[   -- include [ ]`

---

### Combine with other commands

|Action|Example|
|---|---|
|Change inside quotes|`ci"`|
|Change around parentheses|`ca(`|
|Yank inside single quotes|`yi'`|
|Yank around curly braces|`ya{`|
|Visual select inside|`vi"`|
|Visual select around|`va(`|

---

### Bonus: Vim-surround plugin

- Change surrounding quotes/brackets:
    

`cs"'   -- change " to ' ds(    -- delete surrounding parentheses ysw)   -- surround a word with parentheses`

---

### Notes

- `i` = inside (content only)
    
- `a` = around (content + surrounding characters)
    
- Combine `d` / `c` / `y` with any text object for fast editing.

## Delete the buffer
```lua
db
```
