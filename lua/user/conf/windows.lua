local status_ok, windows = pcall(require, "windows")
if not status_ok then
  vim.notify("windows.nvim can not find.")
  return
end

vim.o.winwidth = 10
vim.o.winminwidth = 10
vim.o.equalalways = false
windows.setup({
   autowidth = {
      enable = true,
      winwidth = 5,
      filetype = {
         help = 2,
      },
   },
   ignore = {
      buftype = { "quickfix","nofile"},
      filetype = { "NvimTree", "neo-tree", "undotree", "gundo", "lspsagaoutline", "Outline"}
   },
   animation = {
      enable = true,
      duration = 300,
      fps = 30,
      easing = "in_out_sine"
   }
})
