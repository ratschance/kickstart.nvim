-- True colors
vim.opt.termguicolors = true

-- Guides
vim.opt.colorcolumn = { 80, 120 }

-- Relative Line numbering
vim.opt.relativenumber = true

-- move in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
