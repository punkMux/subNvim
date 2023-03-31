local status_ok, treesitter_context = pcall(require, "treesitter-context")
if not status_ok then
  vim.notify("treesitter_context not found!")
  return
end

treesitter_context.setup({})
