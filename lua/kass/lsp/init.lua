local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
        print("Lspconfig is not installed")
  return
end

require "kass.lsp.mason"
require("kass.lsp.handlers").setup()
require "kass.lsp.null-ls"
