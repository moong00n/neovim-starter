
local api = vim.api

-- term related
api.nvim_command("autocmd TermOpen * startinsert")
api.nvim_command("autocmd TermOpen * setlocal nonumber")
api.nvim_command("autocmd TermEnter * setlocal signcolumn=no")
api.nvim_command("autocmd TermEnter * setlocal norelativenumber")
vim.keymap.set('t', '<esc>', "<C-\\><C-n>") -- esc to exit insert mode
