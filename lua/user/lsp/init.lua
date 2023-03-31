local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("user.lsp.mason")
require('user.lsp.dap_config').setup()
require("user.lsp.rust_tool_config")
