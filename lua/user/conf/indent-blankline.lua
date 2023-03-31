local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
    vim.notify("indent_blankline not found!")
	return
end

vim.opt.list = true

indent_blankline.setup({
  show_current_context = true,
  -- show_current_context_start = true,
})
