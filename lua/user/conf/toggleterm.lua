local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

require("toggleterm").setup{
	size = 20,
  -- TODO: add my own keymapping to <space-t>
	open_mapping = [[<c-\>]],
	hide_numbers = false,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 3,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "horizontal",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 3,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
}

function _G.set_terminal_keymaps()
  -- local opts = {noremap = true}
  -- -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  -- -- vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  -- -- ctrl l preserved for clear terminal content
  -- -- vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)

  local opts = {buffer = 0}
  vim.keymap.set('t', ',q', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal

-- still do not get why "q" can toggle. because of both htop and gitui accept "q" cmd.
local gitui = Terminal:new({
  cmd = "gitui",
  direction = "float",
  --  If the hidden key is set to true, this terminal will not be toggled by normal toggleterm commands such as :ToggleTerm or the open mapping. It will only open and close by using the returned terminal object.
  hidden = true,
})
local htop = Terminal:new({ cmd = "htop", hidden = true })
local python = Terminal:new({ cmd = "python3", hidden = true })
local node = Terminal:new({ cmd = "node", hidden = true })
local procs = Terminal:new({ cmd = "procs", hidden = true })
local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
local bottom = Terminal:new({ cmd = "btm", hidden = true })

function _GITUI_TOGGLE()
	gitui:toggle()
end

function _HTOP_TOGGLE()
	htop:toggle()
end

function _PYTHON_TOGGLE()
    python:toggle()
end

function _NODE_TOGGLE()
	node:toggle()
end

function _NCDU_TOGGLE()
	ncdu:toggle()
end

function _BOTTOM_TOGGLE()
  bottom:toggle()
end




