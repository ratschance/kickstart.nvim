---@module 'lazy'
---@type LazySpec
return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',  -- F7 UI
    'nvim-neotest/nvim-nio', -- dependency for above
    'leoluz/nvim-dap-go',    -- Go DAP
  },
  keys = {
    { '<F5>', function() require('dap').continue() end, desc = 'Debug: Start/Continue' },
    { '<F1>', function() require('dap').step_into() end, desc = 'Debug: Step Into' },
    { '<F2>', function() require('dap').step_over() end, desc = 'Debug: Step Over' },
    { '<F3>', function() require('dap').step_out() end, desc = 'Debug: Step Out' },
    { '<leader>db', function() require('dap').toggle_breakpoint() end, desc = '[d]ebug [b]reakpoint' },
    { '<leader>dB', function() require('dap').set_breakpoint(vim.fn.input 'breakpoint condition: ') end, desc = '[d]ebug [B]reakpoint condition' },
    { '<F7>', function() require('dapui').toggle() end, desc = 'Debug: See last session result.' },
    { '<leader>dT', function() require('dapui').toggle() end, desc = '[d]ebug [T]oggle' },
    {'<leader>dt', function() require('dap-go').debug_test() end, desc = '[d]ebug [t]est' },
    {'<leader>dl',function() require('dap-go').debug_last_test() end, desc = '[d]ebug [l]ast test'},
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    -- For more information, see |:help nvim-dap-ui|
    ---@diagnostic disable-next-line: missing-fields
    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      ---@diagnostic disable-next-line: missing-fields
      controls = {
        icons = {
          pause = '⏸ Pause',
          play = '▶ Play (F5)',
          step_into = '⏎ Into (F1)',
          step_over = '⏭ Over (F2)',
          step_out = '⏮ Out (F3)',
          step_back = 'b Back',
          run_last = '▶▶ Last',
          terminate = '⏹ Stop',
          disconnect = '⏏ Disconnect',
        },
      },
    }

    -- Change breakpoint icons
    vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
    vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
    local breakpoint_icons = vim.g.have_nerd_font
        and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
      or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
    for type, icon in pairs(breakpoint_icons) do
      local tp = 'Dap' .. type
      local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
      vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
    end

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    require('dap-go').setup {
      delve = {
        -- On Windows delve must be run attached or it crashes.
        -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
        detached = vim.fn.has 'win32' == 0,
      },
    }
  end,
}
