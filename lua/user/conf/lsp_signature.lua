cfg = {
}

local status_ok, _ = pcall(require, "lsp_signature")
if not status_ok then
  vim.notify("lsp_signature not found!")
  return
end

-- recommended:
require'lsp_signature'.setup(cfg) -- no need to specify bufnr if you don't use toggle_key
