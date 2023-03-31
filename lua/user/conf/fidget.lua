local status_ok, _ = pcall(require, "fidget")
if not status_ok then
  vim.notify("comment not found!")
  return
end

require"fidget".setup{}
