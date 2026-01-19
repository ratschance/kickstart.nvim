return {
  'lifepillar/vim-solarized8',
  branch = 'neovim',
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'solarized8_flat'
    vim.opt.background = 'dark'
  end,
}
