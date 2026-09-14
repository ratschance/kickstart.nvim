vim.env.SNACKS_GHOSTTY = 'true'
if vim.fn.filereadable '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome' == 1 then
  vim.env.PUPPETEER_EXECUTABLE_PATH = '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome'
end

vim.pack.add { 'https://github.com/folke/snacks.nvim' }

local Snacks = require 'snacks'

Snacks.setup {
  bigfile = { enabled = true },
  dashboard = {
    sections = {
      { pane = 1, icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
      { pane = 1, icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
      { section = 'keys', gap = 1, padding = 1 },
      {
        pane = 2,
        icon = ' ',
        desc = 'Browse Repo',
        padding = 1,
        key = 'b',
        action = function()
          Snacks.gitbrowse()
        end,
      },
      function()
        local in_git = Snacks.git.get_root() ~= nil
        local cmds = {
          {
            icon = ' ',
            title = 'Git Status',
            cmd = 'git --no-pager diff --stat -B -M -C',
            height = 10,
          },
        }
        return vim.tbl_map(function(cmd)
          return vim.tbl_extend('force', {
            pane = 2,
            section = 'terminal',
            enabled = in_git,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          }, cmd)
        end, cmds)
      end,
      { section = 'startup' },
    },
  },
  notifier = { enabled = true },
  terminal = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = {
    enabled = true,
    folds = {
      open = true,
      git_hl = true,
    },
  },
  image = {
    enabled = true,
    convert = {
      notify = true,
    },
  },
  styles = {
    notification = {
      wo = { wrap = true },
    },
  },
}

vim.keymap.set('n', [[<C-p>]], function() Snacks.picker.projects() end, { desc = 'Select Project' })
vim.keymap.set({ 'n', 'v' }, '<leader>gb', function() Snacks.gitbrowse() end, { desc = 'Git Browse' })
vim.keymap.set('n', '<leader>gg', function() Snacks.lazygit() end, { desc = 'Lazygit' })
vim.keymap.set({ 'n', 't' }, [[<C-\>]], function() Snacks.terminal.toggle() end, { desc = 'Toggle Terminal' })
