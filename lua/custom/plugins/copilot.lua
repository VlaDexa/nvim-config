return { -- Copilot
  'github/copilot.vim',
  keys = {
    { '<C-J>', 'copilot#Accept("\\<CR>")', mode = 'i', expr = true, replace_keycodes = false },
  },
  event = 'InsertEnter',
  config = function()
    vim.g.copilot_no_tab_map = true
  end,
}
