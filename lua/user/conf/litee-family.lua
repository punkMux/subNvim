--[[
configure the litee.nvim library 
local status_ok, _ = require('litee.lib')
if not status_ok then
  vim.notify("litee_lib not found!")
  return
end

local status_ok2, _ = require('litee.calltree')
if not status_ok2 then
  vim.notify("litee_calltree not found!")
  return
end

currently must use directly require.setup to init plug. or will get bug can not get the stack.
so be assure litee.lib and litee.calltree be installed first.
--]]
require('litee.lib').setup({
  tree = {
    icon_set = "nerd"
  },
  panel = {
    -- "left" "right" "bottom" "top"
    orientation = "bottom",
    panel_size  = 15
  },
})

-- configure litee-calltree.nvim
-- commands: LTOpenToCalltree to open calltree
require('litee.calltree').setup({
        -- When retrieving Call Hierarchy items some language servers will respond with
        -- different symbol names then when a document symbol or workspace symbol request
        -- is made. 
        --
        -- To unify the experience `litee-calltree.nvim` can collect symbol details for
        -- each Call Hierarhcy item, providing a more accurate display of symbol details
        -- in the Calltree UI window.
        --
        -- This takes a little longer, but is also async, and will not block Neovim.
        resolve_symbols = true,
        -- the jump_mode used for jumping from
        -- calltree node to source code line. 
        -- "invoking" will use the last window that invoked the calltree (feels natural)
        -- "neighbor" will use the closest neighbor opposite to the panel orientation 
        -- (if panel is left, uses window to the right.)
        jump_mode = "invoking",
        -- enables hiding the cursor inside the Calltree UI.
        hide_cursor = true,
        -- Maps arrow keys to resizing the Calltree UI within the `litee.nvim` Panel.
        map_resize_keys = true,
        -- Disables all highlighting.
        no_hls = false,
        -- Determines if initial creation of a calltree opens in the
        -- Panel or in a Popout window. Options are "panel" or "popout"
        on_open = "pannel",
        icon_set = "nerd",
        -- If true, disable all keymaps
        disable_keymaps = false,
        -- The default keymaps. Users can provide overrides
        -- to these mappings via the setup function.
        keymaps = {
          expand = "e",
          collapse = "c",
          collapse_all = "C",
          jump = "<CR>",
          jump_split = "s",
          jump_vsplit = "v",
          jump_tab = "t",
          hover = "i",
          details = "d",
          close = "X",
          close_panel_pop_out = "<Esc>",
          help = "?",
          hide = "H",
          switch = "S",
          focus = "f"
        },
  })
