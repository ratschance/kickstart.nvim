-- toggleterm
-- https://github.com/akinsho/toggleterm.nvim

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = 30,
      open_mapping = [[<C-\>]],
      persist_mode = false, -- I'm not a fan when this opens in normal mode
    }
    local term = require('toggleterm.terminal').Terminal
    local lg = term:new {
      cmd = 'lazygit',
      hidden = true,
      dir = 'git_dir',
      direction = 'float',
      float_opts = {
        border = 'double',
      },
    }
    function LG_TOGGLE()
      lg:toggle()
    end

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
    end
    vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
    vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>lua LG_TOGGLE()<CR>', { noremap = true, silent = true })
  end,
}
