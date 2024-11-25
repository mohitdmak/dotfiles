local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.lsp-installer"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
require "user.lsp.mason"
--- NOTE: [stripe]: `:Mason` was not available even after packer installed it in Mac M3 Pro 16" - just removing and adding the above requires once fixed it
