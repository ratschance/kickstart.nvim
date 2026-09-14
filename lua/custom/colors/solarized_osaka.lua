vim.pack.add { 'https://github.com/craftzdog/solarized-osaka.nvim' }

require('solarized-osaka').setup {
  on_highlights = function(hl, c)
    hl.LspInlayHint = {
      bg = c.bg_highlight,
      fg = c.fg_gutter,
    }
  end,
}

vim.cmd.colorscheme 'solarized-osaka'
vim.opt.background = 'dark'
