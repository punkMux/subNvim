local status_ok, bufferline = pcall(require, "close_buffers")
if not status_ok then
  vim.notify("close_buffers not found!")
  return
end

-- By default, the next_buffer_cmd will attempt to get the next buffer by using the vim buffer ID.

-- This may not be as useful if you use bufferline plugins like nvim-bufferline.lua since you can rearrange the buffer orders ignoring the buffer ID. The following example will use the cycle command provided by nvim-bufferline.lua to get the next buffer when preserving the window layout
require('close_buffers').setup({
  preserve_window_layout = { 'this' },
  next_buffer_cmd = function(windows)
    require('bufferline').cycle(1)
    local bufnr = vim.api.nvim_get_current_buf()

    for _, window in ipairs(windows) do
      vim.api.nvim_win_set_buf(window, bufnr)
    end
  end,
})


