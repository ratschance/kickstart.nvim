return {
  'github/copilot.vim',
  config = function()
    vim.keymap.set('i', '<C-j>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
    })

    -- Set a binding to force a suggestion; that way we can keep this disabled
    -- by default.
    vim.keymap.set('i', '<C-s>', '<Plug>(copilot-suggest)')
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_enabled = false
  end,
}
