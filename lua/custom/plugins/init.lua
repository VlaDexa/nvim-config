-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    -- FIXME: Change this ugly stuff after Neovim 0.10 release
    local _, has_inlay_hints =
      vim.lsp.protocol.Methods and pcall(client.supports_method, vim.lsp.protocol.Methods.textDocument_inlayHint) or false,
      client.server_capabilities.inlayHintProvider
    if client and vim.lsp.inlay_hint and has_inlay_hints then
      vim.lsp.inlay_hint.enable(true)
    end
  end,
})
return {}
