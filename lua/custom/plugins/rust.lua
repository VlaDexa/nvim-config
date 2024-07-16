local test_fts = vim.g.test_fts or {}
table.insert(test_fts, 'rust')
vim.g.test_fts = test_fts

return {
  {
    -- Managing crates.io dependencies --
    'saecki/crates.nvim',
    tag = 'stable',
    event = { 'BufRead Cargo.toml' },
    opts = {},
  },
  {
    'rouge8/neotest-rust',
    dependencies = {
      {
        'nvim-neotest/neotest',
        opts = function()
          return {
            adapters = {
              require 'neotest-rust' {
                args = { '--no-capture' },
              },
            },
          }
        end,
      },
      'nvim-treesitter/nvim-treesitter',
    },
    lazy = true,
  },
}
