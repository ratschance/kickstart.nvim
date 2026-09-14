vim.pack.add {
  'https://github.com/MeanderingProgrammer/render-markdown.nvim',
}

require('render-markdown').setup {
  heading = {
    icons = {},
    sign = true,
    width = 'full',
  },
  code = {
    border = 'none',
    conceal_delimiters = false,
    style = 'full',
    width = 'block',
  },
  bullet = {
    icons = {},
  },
}
