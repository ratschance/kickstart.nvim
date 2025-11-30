return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
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
              icon = ' ',
              title = 'Open PRs',
              cmd = 'gh pr list -L 3',
              key = 'P',
              action = function()
                vim.fn.jobstart('gh pr list --web', { detach = true })
              end,
              height = 7,
            },
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
    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
  },
  keys = {
    {
      [[<C-p>]],
      function()
        Snacks.picker.projects()
      end,
      desc = 'Select Project',
    },
    {
      '<leader>gb',
      function()
        Snacks.gitbrowse()
      end,
      desc = 'Git Browse',
      mode = { 'n', 'v' },
    },
    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      [[<C-\>]],
      function()
        Snacks.terminal.toggle()
      end,
      desc = 'Toggle Terminal',
      mode = { 'n', 't' },
    },
  },
}
