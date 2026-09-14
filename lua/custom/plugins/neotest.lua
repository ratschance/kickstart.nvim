vim.pack.add {
  'https://github.com/nvim-neotest/neotest',
  'https://github.com/nvim-neotest/nvim-nio',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/antoinemadec/FixCursorHold.nvim',
  { src = 'https://github.com/fredrikaverpil/neotest-golang', version = 'v2.6.0' },
}

local config = {
  runner = 'gotestsum',
}
require('neotest').setup {
  adapters = {
    require 'neotest-golang'(config),
  },
}
