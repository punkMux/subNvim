local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
  vim.notify("catppuccin not found")
  return
end

-- make comment from grey(can not be read) to flamingo
require("catppuccin").setup {
  flavour = "macchiato", -- latte, frappe, macchiato, mocha
  custom_highlights = function(colors)
    return {
      Comment = { fg = colors.flamingo },
      ["@comment"] = { fg = colors.maroon, style = { "italic" } },
    }
  end;
  integrations = {
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
  }
}

vim.cmd([[colorscheme catppuccin]])
