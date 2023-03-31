local status_ok, scrollbar= pcall(require, "scrollbar")
if not status_ok then
  vim.notify("scrolls not found!")
  return
end

scrollbar.setup({
  handlers = {
    cursor = false,
    diagnostic = true,
    gitsigns = true, -- Requires gitsigns
    handle = true,
    search = true, -- Requires hlslens
    ale = false, -- Requires ALE
  }
})
require("scrollbar.handlers.gitsigns").setup()


