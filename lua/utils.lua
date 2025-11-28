local M = {}
function M.map(mode,lhs,rhs,opts) vim.keymap.set(mode,lhs,rhs,opts or { noremap=true, silent=true }) end
return M
