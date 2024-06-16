return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'folke/which-key.nvim',
  },
  opts = {},
  config = function(_, opts)
    require('which-key').register({
      ['<leader>r'] = {
        name = '+Refactor',
      },
    }, { prefix = '<leader>' })
    require('refactoring').setup(opts)
  end,
  keys = {
    { '<leader>re', ':Refactor extract ', mode = 'x', desc = '[E]xtract to func' },
    { '<leader>rf', ':Refactor extract_to_file ', mode = 'x', desc = 'Extract to [F]ile' },
    { '<leader>rv', ':Refactor extract_var ', mode = 'x', desc = 'Extract to [V]ariable' },
    { '<leader>ri', ':Refactor inline_var', mode = { 'n', 'x' }, desc = '[I]nline variable' },
    { '<leader>rI', ':Refactor inline_func', mode = 'n', desc = '[I]nline function' },
    { '<leader>rb', ':Refactor extract_block', mode = 'n', desc = 'Extract [B]lock' },
    { '<leader>rbf', ':Refactor extract_block_to_file', mode = 'n', desc = 'Extract [B]lock to [F]ile' },
  },
  cmd = 'Refactor',
}
