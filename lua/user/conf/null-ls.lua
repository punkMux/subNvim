local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  vim.notify("null_ls not found!")
  return
end

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.completion.spell,
    null_ls.builtins.code_actions.cspell,
    null_ls.builtins.diagnostics.cspell,
    -- null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.formatting.rustfmt,
  },
})


