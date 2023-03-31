-- Lua
local status_ok, _ = pcall(require, "diffview")
if not status_ok then
  vim.notify("diffview not found!")
  return
end


require 'diffview'.setup ({})
