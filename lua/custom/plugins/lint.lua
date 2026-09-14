---@module 'lazy'
---@type LazySpec
return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'
    lint.linters_by_ft = {
      -- markdown = { 'markdownlint' }, -- Make sure to install `markdownlint`
      sh = { 'shellcheck' },
    }

    -- Create autocommand which carries out the actual linting on the specified events.
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        -- Only run the linter in modifiable buffers
        if vim.bo.modifiable then lint.try_lint() end
      end,
    })
  end,
}
