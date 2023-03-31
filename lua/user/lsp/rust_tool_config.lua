-- rust-tool is a nvim-dap Debug-Adapter Installation & Configuration extension. will auto config the Debug Adapter.
--     DAP-Client ----- Debug Adapter ------- Debugger ------ Debugee
--     (nvim-dap)  |   (per language)  |   (per language)    (your app)
--                 |                   |
--                 |        Implementation specific communication
--                 |        Debug adapter and debugger could be the same process
--                 |
--          Communication via the Debug Adapter Protocol

local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

local rt = require("rust-tools")

rt.setup({
  tools = {
    inlay_hints = {
      auto = false,
    },
    server = {
      standalone = true,
      on_attach = function(_, bufnr)
        -- Hover actions
        vim.keymap.set("n", "mh", rt.hover_actions.hover_actions, { buffer = bufnr })
        -- Code action groups
        vim.keymap.set("n", "mg", rt.code_action_group.code_action_group, { buffer = bufnr })

        -- Rust... command.
        -- RustEnableInlayHints
        -- RustDisableInlayHints
        -- RustSetInlayHints
        -- RustUnsetInlayHints
        local opts = { noremap = true, silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<A-cr>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

        -- vim.api.nvim_buf_set_keymap(bufnr,"n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        -- vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>t", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
        -- vim.api.nvim_buf_set_keymap(bufnr,"n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        -- vim.api.nvim_buf_set_keymap(bufnr,"n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        -- vim.api.nvim_buf_set_keymap(bufnr,"n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
        -- vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        -- vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>rf", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        -- vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
        -- vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>dj",'<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',opts)
        -- vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>dk",'<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>',opts)
        -- vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>dq","<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
      end,
    },
    dap = {
      adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
    },
  },
})
