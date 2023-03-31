local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  vim.notify("autopairs not found!")
  return
end

npairs.setup({})
