local test_fts = vim.g.test_fts or {}
table.insert(test_fts, 'rust')
vim.g.test_fts = test_fts
vim.g.rustaceanvim = {
  -- LSP configuration
  server = {
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
        rustc = { source = 'discover' },
      },
    },
  },
}

return {
  {
    -- Managing crates.io dependencies --
    'saecki/crates.nvim',
    tag = 'stable',
    event = { 'BufRead Cargo.toml' },
    opts = {},
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  {
    'nvim-neotest/neotest',
    opts = function()
      return { adapters = {
        require 'rustaceanvim.neotest',
      } }
    end,
  },
}
