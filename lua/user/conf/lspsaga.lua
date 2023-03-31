local status_ok, _ = pcall(require, "lspsaga")
if not status_ok then
  vim.notify("lspsaga not found!")
  return
end

vim.notify("success init lspsaga")
require("lspsaga").setup({
  outline = {
    win_position = "right",
    win_with = "5",
    win_width = 30,
    show_detail = true,
    auto_preview = true,
    auto_refresh = true,
    auto_close = true,
    custom_sort = nil,
    keys = {
      jump = "o",
      expand_collapse = "u",
      quit = "q",
    },
  },
})

