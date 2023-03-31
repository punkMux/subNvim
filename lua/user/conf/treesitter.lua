local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify("treesitter not found!", vim.log.levels.ERROR)
  return
end

configs.setup {
  ensure_installed = { "cpp", "c", "python", "go", "markdown", "json", "yaml", "html",  "rust", "lua", "toml", "typescript", "solidity","vim"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing

  incremental_selection = {
    enable = true,
    keymaps = {
      -- init_selection = "<CR>",
      node_incremental = "<CR>",
      scope_incremental = "<TAB>",
      node_decremental = "<BS>",
    },
  },

  indent = {
    enable = true
  },

  -- textobjects extension settings
  -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  textobjects = {
    swap = {
      enable = false,
    },
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        -- "a{}" "a[]" "a()" still work
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = false, -- whether to set jumps in the jumplist
      -- "same with keymaps. ]/[ + {}/[]/() also work"
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ["]f"] = "@function.outer",
        ["]c"] = "@class.outer",
      },
    },
  },
}

-- use zc to collapse. zo to expand. this will better than vim built in fold.
-- From Neovim oficial doc: https://neovim.io/doc/user/lua.html#vim.opt  vim.o.wildignore = ‘*.o', '*.a'  or vim.opt.wildignore = { ’*.o' , '*.a' }
-- also check option.lua to config most of vim option.
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 99

