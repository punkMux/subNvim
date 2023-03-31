local status_ok, scrollview = pcall(require, "scrollview")
if not status_ok then
  vim.notify("scrollview not found!")
  return
end

scrollview.setup({
  -- current_only = true,
  -- winblend = 50,
  -- base = 'buffer',
  -- column =50 
})
