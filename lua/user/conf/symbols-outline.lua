-- https://github.com/simrat39/symbols-outline.nvim
local status_ok, symbols_outline = pcall(require, "symbols-outline")
if not status_ok then
  vim.notify("symbols-outline not found!")
  return
end

-- we can know symbol-outline plugin set it's filetye to Outline. with code ' vim.api.nvim_buf_set_option(self.bufnr, 'filetype', 'Outline') when init.
local opts = {
  -- set fixed width if add windows.nvim plugin. or the windows plugin will set it high to pop full window
  width = 20,
  auto_preview = false,
  keymaps = {
    -- other set to default
    goto_location = {"<2-LeftMouse>" , "<Cr>"},
  },
}

symbols_outline.setup(opts)
