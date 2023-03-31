local status_ok, _ = pcall(require, "FTerm")
if not status_ok then
  vim.notify("FTerm not found!")
  return
end

require'FTerm'.setup({
  ft = 'FTerm',
  cmd = os.getenv('SHELL'),
  border = 'double',
  dimensions  = {
    height = 0.9,
    width = 0.9,
  },
})


