return {
  {
    -- Managing crates.io dependencies --
    'saecki/crates.nvim',
    tag = 'stable',
    event = { 'BufRead Cargo.toml' },
    config = function()
      require('crates').setup()
    end,
  },
  {
    'rouge8/neotest-rust',
    dependencies = {
      {
        'nvim-neotest/neotest',
        opts = function(_, opts)
          opts.adapters = opts.adapters or {}
          table.insert(
            opts.adapters,
            require 'neotest-rust' {
              args = { '--no-capture' },
            }
          )
        end,
      },
      'nvim-treesitter/nvim-treesitter',
    },
    ft = 'rust',
  },
}
