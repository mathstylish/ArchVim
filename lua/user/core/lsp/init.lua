local ok, _ = pcall(require, "lspconfig")
if not ok then
  return
end

require("user.core.lsp.mason")
require("user.core.lsp.handlers").setup()
require("user.core.lsp.null-ls")
