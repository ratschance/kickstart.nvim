vim.opt.termguicolors = true      -- set up truecolors
vim.opt.modeline = false          -- modeline parses vimoptions from a comment in a  file. no ty
vim.opt.colorcolumn = { 80, 120 } -- column guides
vim.opt.relativenumber = true
vim.opt.winborder = "rounded"
vim.g.have_nerd_font = true
vim.opt.list = false

-- folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldtext = ''          -- syntax-highlighted folded text (Neovim 0.10+)
vim.opt.foldlevel = 99         -- open all folds by default
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 4        -- avoid excessive nesting folds

-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
  virtual_text = {
    source = 'if_many',
    spacing = 2,
  },
  -- Display multiline diagnostics as virtual lines
  --virtual_lines = true,
}

-- move in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- extra filetype mappings
vim.filetype.add {
  pattern = {
    ['.*/tiltfile'] = 'starlark',
    ['.*/templates/.*%.ya?ml'] = 'helm',
    ['.*/templates/.*%.tpl'] = 'helm',
    ['helmfile.*%.ya?ml'] = 'helm',
  }
}

-- use the gotmpl treesitter parser for helm files
vim.treesitter.language.register('gotmpl', 'helm')

-- toggle virtual lines for diagnostics
vim.keymap.set('n', '<leader>tv', function()
  local enable_lines = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({
    virtual_lines = enable_lines,
    virtual_text = not enable_lines and { source = 'if_many', spacing = 2 } or false,
  })
end, { desc = '[t]oggle [v]irtual lines' })

vim.keymap.set('n', 'gh', vim.lsp.buf.hover, {desc = '[g]oto [h]over'})
-- extra search telescopes
vim.keymap.set('n', '<leader>,', function() require('telescope.builtin').find_files() end, { desc = 'search files' })

