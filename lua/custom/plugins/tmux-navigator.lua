-- Keep the explicit direction mappings below without taking Snacks' <C-\>.
vim.g.tmux_navigator_no_mappings = 1

vim.pack.add { 'https://github.com/christoomey/vim-tmux-navigator' }

local directions = { h = 'Left', j = 'Down', k = 'Up', l = 'Right' }
for key, direction in pairs(directions) do
  vim.keymap.set('n', '<c-' .. key .. '>', '<cmd>TmuxNavigate' .. direction .. '<cr>', { desc = 'Navigate ' .. direction })
  if vim.env.TMUX then
    vim.keymap.set('t', '<c-' .. key .. '>', function()
      if vim.bo.filetype == 'fzf' then return vim.keycode('<c-' .. key .. '>') end
      return vim.keycode('<C-w>:TmuxNavigate' .. direction .. '<cr>')
    end, { expr = true, desc = 'Navigate ' .. direction })
  end
end
