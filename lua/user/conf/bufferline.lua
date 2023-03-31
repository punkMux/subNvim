local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  vim.notify("bufferline not found!")
  return
end

vim.opt.termguicolors = true
bufferline.setup ({
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    numbers = "ordinal", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
    offsets = {{filetype = "NvimTree", text = "File Explorer", text_align="center", separator = true}}, -- | function , text_align = "left" | "center" | "right"}},
    sort_by = "insert_after_end" -- 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs'
  },
  -- highlights = require("catppuccin.groups.integrations.bufferline").get()

  highlights = {
    -- fill = {
    --   fg = "#d700ff",
    --   bg = "#afd7ff",
    --   bold = true,
    -- },
    -- background = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>'
    -- },
    -- tab = {
    --   fg = "#ffff5f",
    --   bg = "#afd7ff",
    -- },
    tab_selected = {
      fg = "#ffff5f",
      bg = "#afd7ff",
      bold = true,
    },
    -- tab_close = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>'
    -- },
    --
    -- visible is the buffer you opened in windows. like vsplit you will get more visible buffer.
    pick_selected = {
      -- fg = '#626262',
      -- fg = '#626262',
      -- bg = '<colour-value-here>',
      -- bold = true,
      -- italic = true,
    },
    pick_visible = {
      -- fg = '#626262',
      -- bg = '<colour-value-here>',
      -- bold = true,
      -- italic = true,
    },
    -- the color when you use Bufferlinepick cmd
    pick = {
      fg = "#d700ff",
      -- fg = '#626262',
      -- fg = '<colour-value-here>',
      -- bg = '<colour-value-here>',
      bold = true,
      -- italic = true,
    },
    numbers = {
      -- fg = "#000000",
    },

    numbers_visible = {
      fg = "#ffd700",
      bg = "#3a3a3a",
      italic = true,
    },
    buffer_visible = {
      fg = "#ffd700",
      bg = "#3a3a3a",
      italic = true,
    },
    duplicate_visible = {
      fg = "#ffd700",
      bg = "#3a3a3a",
      italic = true
    },

    numbers_selected = {
      fg = "#d700ff",
      bg = "#afd7ff",
      bold = true,
    },
    buffer_selected = {
      fg = "#d700ff",
      -- fg = "#d7ff00",
      bg = "#afd7ff",
      bold = true,
    },
    duplicate_selected = {
      fg = "#d700ff",
      bg = "#afd7ff",
      bold = true,
    },
    -- duplicate = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>'
    --   italic = true
    -- },
  },
})
