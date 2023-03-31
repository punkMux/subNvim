local status_ok, fzflua= pcall(require, "fzf-lua")
if not status_ok then
  vim.notify("fzflua not found!")
  return
end

fzflua.setup({
  fzf_bin = 'sk',   -- use skim instead of fzf? -- https://github.com/lotabout/skim

  winopts = {
    fullscreen       = false,           -- start fullscreen?
    preview = {
      layout         = 'vertical',          -- horizontal|vertical|flex
      vertical       = 'up:60%'             -- up|down:size   /only valid with vertical layout.
      -- horizontal     = 'right:60%',     -- right|left:size
    },
  },

  keymap = {
    -- These override the default tables completely
    -- no need to set to `false` to disable a bind
    -- delete or modify is sufficient
    builtin = {
      ["<C-h>"]        = "toggle-help",
      ["<C-w>"]        = "toggle-fullscreen",
      -- Rotate preview clockwise/counter-clockwise
      ["<C-]>"]        = "toggle-preview-cw",
    },
  },
})
