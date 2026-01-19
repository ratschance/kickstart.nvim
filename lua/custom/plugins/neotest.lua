return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      {
        'nvim-treesitter/nvim-treesitter', -- Optional, but recommended
        -- branch = 'main',
      },
      {
        'fredrikaverpil/neotest-golang',
        version = 'v2.6.0', -- Optional, but recommended; track releases
      },
    },
    config = function()
      local config = {
        runner = 'gotestsum', -- Optional, but recommended
      }
      require('neotest').setup {
        adapters = {
          require 'neotest-golang'(config),
        },
      }
    end,
  },
}
