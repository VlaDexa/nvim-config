return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    {
      '<leader>ctr',
      function()
        require('neotest').run.run()
      end,
      desc = 'Tests: Run nearest [T]est',
    },
    {
      '<leader>ctf',
      function()
        require('neotest').run.run(vim.fn.expand '%')
      end,
      desc = 'Tests: Run current [F]ile tests',
    },
  },
}