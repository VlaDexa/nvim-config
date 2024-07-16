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
      desc = 'Tests: [R]un nearest test',
      ft = vim.g.test_fts,
    },
    {
      '<leader>ctf',
      function()
        require('neotest').run.run(vim.fn.expand '%')
      end,
      desc = 'Tests: Run current [F]ile tests',
      ft = vim.g.test_fts,
    },
  },
}
