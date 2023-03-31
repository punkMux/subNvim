local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { m = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts_leader = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Sp"ecify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings_leader = {
  -- [";"] = {
  --   name = "special test",
  --   ["a"]= { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Telescope find files"},
  --   ["b"]= { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  --   ["c"]= { "<cmd>NvimTreeToggle<cr>", "Nvimtree File Explorer" },
  -- },
}

-- a, b c
local mappings_g =  {
    ["b"] = { "<cmd>Alpha<cr>", "Welcome" },
    ["c"] = { "<cmd>Alpha<cr>", "Welcome" },
    ["l"] = { "<cmd>Alpha<cr>", "Welcome" },
    ["y"] = { "<cmd>Alpha<cr>", "Welcome" },
    ["z"] = { "<cmd>Alpha<cr>", "Welcome" }
}
-- for next and prev
-- c,d,f,i,m,p,s,z already in builtin
-----------------------------------------for prefix ']' '[' setting---------------------------------------------
local opts_next = {
  mode = "n", -- NORMAL mode
  prefix = "]",
  buffer = nil, -- Global mappings. Sp"ecify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings_next = {
  ["t"] = { "<cmd>lua require('todo-comments').jump_next()<cr>", "Next todo comments"},
  ["d"] = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Diagnostic jump next" },
}

local opts_prev = {
  mode = "n", -- NORMAL mode
  prefix = "[",
  buffer = nil, -- Global mappings. Sp"ecify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings_prev = {
  ["t"] = { "<cmd>lua require('todo-comments').jump_prev()<cr>", "Prev todo comments"},
  ["d"] = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Diagnostic jump prev" },
}

-- for windows and other left quick cmd
-----------------------------------------for prefix '\'(<Bslash>) setting---------------------------------------------
local opts_Bslash = {
  mode = "n", -- NORMAL mode
  prefix = "<Bslash>",
  buffer = nil, -- Global mappings. Sp"ecify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings_Bslash = {
  ["w"] = { "<cmd>WindowsMaximize<cr>", "Windows max size"},
  ["e"] = { "<cmd>WindowsEqualize<cr>", "Windows equal size"},
  ["g"] = { "<cmd>WindowsToggleAutowidth<cr>", "Windows toggle AutoWidth"},
  ["t"] = { "<cmd>TodoTelescope<cr>", "Todo show telescope"},
  ["s"] = { "<cmd>HopWord<cr>", "HopWord"},
  ["b"] = { "<cmd>HopLine<cr>", "HopLine"},
  -- ["s"] = { "<cmd>HopLine<cr>", "HopChar1"}
}

-- for search,substitude
-----------------------------------------for prefix 's' setting---------------------------------------------
local opts_s= {
  mode = "n", -- NORMAL mode
  prefix = "s",
  buffer = nil, -- Global mappings. Sp"ecify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings_s = {
  ["p"] = { "<cmd>SessionManager load_session<cr>", "Load project session" },
  ["a"] = { "<cmd>FzfLua live_grep_native<cr>", "Live grep native"},
  ["b"] = { "<cmd>FzfLua lgrep_curbuf<cr>", "Live grep current buffer"},
  ["j"] = { "<cmd>lua require('fzf-lua').tagstack( { winopts = { fullscreen = true, preview = { vertical = 'up:55%',layout = 'vertical' }}})<cr>", "Tagstack"},

  ["f"] = {
    name = "Files",
    ["b"] = { "<cmd>FzfLua buffers<cr>", "File buffers"},
    ["f"] = { "<cmd>lua require('fzf-lua').files({})<cr>", "Files search"},
    ["o"] = { "<cmd>FzfLua oldfiles<cr>", "Oldfiles search"},
  },

  ["m"] = {
    name = "Other misc",
    ["m"] = { "<cmd>FzfLua man_pages<cr>", "Man Pages help"},
    ["k"] = { "<cmd>FzfLua keymaps<cr>", "Keymaps help"},
    ["h"] = { "<cmd>FzfLua help_tags<cr>", "Help tags"},
    ["q"] = { "<cmd>FzfLua quickfix<cr>", "Quickfix"},
    ["t"] = { "<cmd>FzfLua tabs<cr>", "Tabs"},
    ["c"] = { "<cmd>FzfLua changes<cr>", "Changes"},
    ["e"] = { "<cmd>lua require'rust-tools'.expand_macro.expand_macro()<cr>", "Rust expand macro"},
  },

  ["l"] = {
    name = "Lsp",
    ["r"] = { "<cmd>FzfLua lsp_references<cr>", "Lsp references"},
    ["t"] = { "<cmd>FzfLua lsp_definitions<cr>", "Lsp definition"},
    ["d"] = { "<cmd>FzfLua lsp_declaration<cr>", "Lsp declaration"},
    ["p"] = { "<cmd>FzfLua lsp_typedefs<cr>", "Lsp typedefs"},
    ["i"] = { "<cmd>FzfLua lsp_implementations<cr>", "Lsp implementions" },
    ["s"] = { "<cmd>FzfLua lsp_document_symbols<cr>", "Lsp document symbols"},
    ["z"] = { "<cmd>FzfLua lsp_workspace_symbols<cr>", "Lsp workspae symbols"},
    ["w"] = { "<cmd>FzfLua lsp_live_workspace_symbols<cr>", "Lsp live workspace symbols"},
    ["a"] = { "<cmd>FzfLua lsp_code_action<cr>", "Lsp code action"},
    ["u"] = { "<cmd>FzfLua lsp_incoming_calls<cr>", "Lsp incoming calls" },
    ["o"] = { "<cmd>FzfLua lsp_outgoing_calls<cr>", "Lsp outgoing calls" },
    ["g"] = { "<cmd>FzfLua lsp_document_diagnostics<cr>", "Lsp document diagnostic" },
    ["x"] = { "<cmd>FzfLua lsp_work_diagnostics<cr>", "Lsp workspace diagnostic" },
  },

  ["g"] = {
    name = "Git",
    ["s"] = { "<cmd>FzfLua git_status<cr>", "Git status"},
    ["c"] = { "<cmd>FzfLua git_commits<cr>", "Git commits"},
    ["l"] = { "<cmd>FzfLua git_bcommits<cr>", "Git buffer commits"},
    ["b"] = { "<cmd>FzfLua git_branches<cr>", "Git branches"},
    ["t"] = { "<cmd>FzfLua git_stash<cr>", "Git stash"},
  },

  ["s"] = {
    name = "Search",
    ["g"] = { "<cmd>FzfLua grep<cr>", "Grep or rg pattern"},
    ["o"] = { "<cmd>FzfLua grep_last<cr>", "Grep last"},
    ["w"] = { "<cmd>FzfLua grep_cword<cr>", "Grep cword"},
    ["W"] = { "<cmd>FzfLua grep_cWORD<cr>", "Grep cWORD"},
    ["v"] = { "<cmd>FzfLua grep_visual<cr>", "Grep visual"},
    ["b"] = { "<cmd>FzfLua lgrep_curbuf<cr>", "Grep live curbuf"},
    ["r"] = { "<cmd>FzfLua live_grep_resume<cr>", "Grep live resume"},
    ["a"] = { "<cmd>FzfLua live_grep_native<cr>", "Grep live native"},
  },
}

-----------------------------------------for prefix comma setting---------------------------------------------
local opts_comma= {
  mode = "n", -- NORMAL mode
  prefix = ",",
  buffer = nil, -- Global mappings. Sp"ecify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings_comma = {
  -- buffer command.
  ["n"] = { ":BufferLineCycleNext<cr>", "Buffer next"},
  ["p"] = { ":BufferLineCyclePrev<cr>", "Buffer prev"},
  ["b"] = { ":BufferLinePick<cr>", "Buffer pick"},
  ["q"] = { "<cmd>lua require('close_buffers').delete({ type = 'this' })<cr>", "Close buffer"},
  ["c"] = { "<cmd>lua require('close_buffers').delete({ type = 'other' })<cr>", "Close all other buffer"},
  ["a"] = { ":BufferLineTogglePin<cr>", "Buffer pin"},

  -- search command. lsp navigattion, search string word func_define symbol etc.
  ["f"] = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find files"},
  ["o"] = { "<cmd>Telescope oldfiles<cr>", "Find in old files"},
  ["e"] = { "<cmd>NvimTreeToggle<cr>","NvimTree toggle"},
  ["r"] = { "<cmd>lua require('telescope.builtin').lsp_references()<cr>", "Lsp references"},
  ["t"] = { "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", "Lsp definitions" },
  ["i"] = { "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", "Lsp implementions" },
  ["d"] = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", "Lsp document symbols"},
  ["z"] = { "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", "Lsp workspace symbol"},
  ["w"] = { "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", "Lsp dynamic workspace symbols"},
  ["g"] = { "<cmd>Telescope current_buffer_fuzzy_find theme=ivy skip_empty_lines=true<cr>", "Find text fuzzy curr buf" },
  ["j"] = { "<cmd>Telescope tagstack theme=dropdown<cr>", "List jump list" },

  ["u"] = { "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", "Incoming calls"},
  ["x"] = { "<cmd>lua vim.lsp.buf.outgoing_calls()<cr>", "Outgoing calls"},
  ["v"] = { "<cmd>SymbolsOutline<CR>", "SymbolsOutline"},
  -- h, j, k, l, m, x, y

  ["s"] = {
    name = "Grep strings",
    ["s"] = { "<cmd>lua require('telescope.builtin').grep_string()<cr>", "Grep word under cursor" },
    ["a"] = { "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args(require('telescope.themes').get_ivy())<cr>", "Find Text" }, -- note: live_grep different with live_grep_args
    ["f"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
  },

  [","] = {
    name = "Other future config",
    -- ["b"] = { "<cmd>lua require('telescope.builtin.Builtins')<cr>", "Lists Built-in pickers and run them on<cr>" }
  },
}

------------------------------------for prefix "<space>" setting----------------------------------------
local opts_space = {
  mode = "n", -- NORMAL mode
  prefix = "<Space>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings_space = {
  ["q"] = { ":q<cr>", "Quit current file, :q<cr>"},
  ["w"] = { ":w<cr>", "Save currenly file, :w<cr>"},

  d = {
    name = "Debug",
    R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
    E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
    X = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
    B = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
    t = { "<cmd>lua require'dapui'.toggle('sidebar')<cr>", "Toggle Sidebar" },
    p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    k = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
    g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
    s = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
  },

  g = {
     name = "Git",
     f = { "<cmd>DiffviewFileHistory<CR>", "File History" },
     p = { "<cmd>DiffviewOpen<CR>", "Diff Project Open" },
     q = { "<cmd>DiffviewClose<CR>", "Diff Project Close" },
     j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
     k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
     l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame line" },
     r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
     R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
     s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
     S = { "<cmd>lua require 'gitsigns'.stage_buffer()<cr>", "Stage buffer" },
     u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk", },
     t = { "<cmd>lua require 'gitsigns'.toggle_numhl()<cr>", "Toggle numhl", },
     h = { "<cmd>lua require 'gitsigns'.toggle_linehl()<cr>", "Toggle linehl", },
     d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
     o = { "<cmd>Telescope git_status<cr>", "Git status" },
     b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
     c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
  },

  l = {
    name = "LSP",
    i = { "<cmd>Lspsaga incoming_calls<cr>", "Incoming calls" },
    o = { "<cmd>Lspsaga outgoing_calls<cr>", "Outgoing calls" },
    p = { "<cmd>Lspsaga peek_definition<cr>", "Peek_definition" },
    f = { "<cmd>Lspsaga lsp_finder<cr>", "Lsp finder/reference" },
    a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
    r = { "<cmd>Lspsaga rename ++project<cr>", "Rename symbol" },
    t = { "<cmd>Lspsaga goto_definition<cr>", "Goto definition" },
    c = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", "Show cursor diagnostics" },
    l = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show line diagnostics" },
    b = { "<cmd>Lspsaga show_buf_diagnostics<cr>", "Show buf diagnositics" },
    k = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Diagnostic jump prev" },
    j = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Diagnostic jump next" },
    J = { "<cmd>lua require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })<cr>", "Diagnostic jump ext ERROR" },
    K = { "<cmd>lua require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })<cr>", "Diagnostic jump prev ERROR" },
    v = { "<cmd>Lspsaga outline<cr>", "LspSaga Outline" },
    h = { "<cmd>Lspsaga hover_doc ++keep<cr>", "Action" },
  },

  h = {
    name = "Some misc tools",
    y = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    t = { "<cmd>Telescope help_tags<cr>", "Help tags" },
    m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    c = { "<cmd>Telescope commands<cr>", "Commands" },
  },

  -- presss ? for help replace.
  r = {
    name = "Replace",
    f = { "<cmd>lua require('spectre').open_file_search()<CR>", "Replace File" },
    p = { "<cmd>lua require('spectre').open()<CR>", "Replace Project" },
    w = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Search" },
  },

  t = {
    name = "Terminal",
    g = { "<cmd>lua _GITUI_TOGGLE()<cr>", "GitUi" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "Ncdu" },
    b = { "<cmd>lua _BOTTOM_TOGGLE() direction=float<cr>", "Bottom" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },

  b = {
    name = "Trouble",
    t = { "<cmd>Trouble<cr>", "ToggleTrouble" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics"},
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics"},
    q = { "<cmd>Trouble quickfix<cr>", "Quick Fix"},
    r = { "<cmd>Trouble lsp_references<cr>", "lsp_references"},
    g = { "<cmd>Gitsigns setloclist<cr>", "Open changed hunk" },
    j = { "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>", "trouble next"},
    k = { "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>", "trouble previous"},
    f = { "<cmd>lua require('trouble').first({skip_groups = true, jump = true})<cr>", "trouble first"},
    l = { "<cmd>lua require('trouble').last({skip_groups = true, jump = true})<cr>", "trouble last"},
  },

  o = {
    f = { "<cmd>Format<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstall<cr>", "Installer Info" },
    m = { "<cmd>mason<cr>", "lsp server/linter/dap/etc"},
    j = {
      "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    c = { "<cmd>ColorizerToggle<cr>", "Visualize color code"}
  },
}

-- prefer  ";" "<space>" "," "\" , "s"
which_key.setup(setup)

which_key.register(mappings_space, opts_space)
which_key.register(mappings_leader,opts_leader)
which_key.register(mappings_comma, opts_comma)
which_key.register(mappings_s, opts_s)
which_key.register(mappings_Bslash, opts_Bslash)
which_key.register(mappings_next, opts_next)
which_key.register(mappings_prev, opts_prev)

--[[
In Vim the quickfix commands are used more generally to find a list of positions 
in files.For example, |:vimgrep| finds pattern matches.  You can use the positions 
in a script with the |getqflist()| function. Thus you can do a lot more than the
edit/compile/fix cycle!

A location list is similar to a quickfix list and contains a list of positions 
in files.  A location list is associated with a window and each window can have 
a separate location list.  A location list can be associated with only one window.  
The location list is independent of the quickfix list.
--]]
