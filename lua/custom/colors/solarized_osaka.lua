return {
  'craftzdog/solarized-osaka.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    on_highlights = function(hl, c)
      hl.LspInlayHint = {
        bg = c.bg_highlight, -- Solarized base02 (subtle background highlight)
        fg = c.fg_gutter,    -- Very muted foreground, fits perfectly with the scheme
      }
    end,
  },
  init = function()
    vim.cmd.colorscheme 'solarized-osaka'
    vim.opt.background = 'dark'
  end,
}
