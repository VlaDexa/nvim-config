-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
      vim.lsp.inlay_hint.enable(true)
    end
  end,
})

---@module "lazy"
---@type LazySpec
return {
  { 'echasnovski/mini.nvim', event = 'VeryLazy' },
  { 'lewis6991/gitsigns.nvim', event = 'BufReadPost' },
  { 'tpope/vim-sleuth', event = 'BufReadPost' },
  {
    'powerman/vim-plugin-AnsiEsc',
    cmd = 'AnsiEsc',
    init = function()
      vim.api.nvim_create_autocmd('BufReadPost', {
        pattern = '*.txt',
        callback = function()
          vim.cmd.AnsiEsc()
        end,
      })
    end,
  },
}
