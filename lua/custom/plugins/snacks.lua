return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  init = function()
    vim.env.SNACKS_GHOSTTY = 'true'
    if vim.fn.filereadable '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome' == 1 then
      vim.env.PUPPETEER_EXECUTABLE_PATH = '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome'
    end
  end,
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
    image = {
      enabled = true,
      convert = {
        notify = true, -- show notification if mmdc / mermaid compilation fails
      },
    },
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
