local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

--[[
 Autocommand that reloads neovim whenever you save the plugins.lua file
 vim.cmd [[
   augroup packer_user_config
     autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerSync
   augroup end
 ]]
--]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    -- open_fn = function()
    --   return require("packer.util").float { border = "rounded" }
    -- end,
  },
  git = {
     clone_timeout = false,
  },
}


--[[
 useage
 use {
   "myusername/example",        -- The plugin location string
   -- The following keys are all optional
   disable = boolean,           -- Mark a plugin as inactive
   as = string,                 -- Specifies an alias under which to install the plugin
   installer = function,        -- Specifies custom installer. See "custom installers" below.
   updater = function,          -- Specifies custom updater. See "custom installers" below.
   after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
   rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
   opt = boolean,               -- Manually marks a plugin as optional.
   branch = string,             -- Specifies a git branch to use
   tag = string,                -- Specifies a git tag to use. Supports "*" for "latest tag"
   commit = string,             -- Specifies a git commit to use
   lock = boolean,              -- Skip updating this plugin in updates/syncs. Still cleans.
   run = string, function, or table, -- Post-update/install hook. See "update/install hooks".
   requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
   rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
   config = string or function, -- Specifies code to run after this plugin is loaded.
   -- The setup key implies opt = true
   setup = string or function,  -- Specifies code to run before this plugin is loaded.
   -- The following keys all imply lazy-loading and imply opt = true
   cmd = string or list,        -- Specifies commands which load this plugin. Can be an autocmd pattern.
   ft = string or list,         -- Specifies filetypes which load this plugin.
   keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
   event = string or list,      -- Specifies autocommand events which load this plugin.
   fn = string or list          -- Specifies functions which load this plugin.
   cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
   module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
                                -- with one of these module names, the plugin will be loaded.
   module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When
   requiring a string which matches one of these patterns, the plugin will be loaded.
 }
--]]

-- Install your plugins here
return packer.startup(function(use)
  -- 1. common plug
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "lewis6991/impatient.nvim" -- Speed up loading Lua modules    TODO: figure out how to use this
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "rcarriga/nvim-notify" -- notify
  use 'kyazdani42/nvim-web-devicons' -- optional, for file icons
  use "kazhala/close-buffers.nvim"
  use "folke/tokyonight.nvim"

  -- 2. Colorschemes for first
  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use { "projekt0n/github-nvim-theme", tag = "v0.0.6", }
  use { "catppuccin/nvim", as = "catppuccin" }

  -- 2. Telescope
  -- vim-clap or fzf for a option
  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.x",
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }
  use "nvim-telescope/telescope-ui-select.nvim"
  use "nvim-telescope/telescope-live-grep-args.nvim" -- use 'c-k' to enable pass args to command 'rg'
  -- use "nvim-telescope/telescope-dap.nvim"
  
  -- fzf stuff
  use { 'ibhagwan/fzf-lua',requires = { 'nvim-tree/nvim-web-devicons' }}

  -- 3. Treesittetr
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", }
  use { "nvim-treesitter/nvim-treesitter-textobjects", }
  use "romgrk/nvim-treesitter-context" -- show class/function at the top

  -- 4. LSP
  use "neovim/nvim-lspconfig" -- LSP client
  use "williamboman/mason.nvim" -- manage external tool like lsp-server/dap-server/linter/formatter/etc...
  -- make sure `lspconfig` is not loaded after `mason-lspconfig`. make sure not to set up any servers via `lspconfig` _before_ calling `mason-lspconfig`'s setup function.
  use "williamboman/mason-lspconfig.nvim"
  use "folke/trouble.nvim"
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })

  -- code action.
  use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = { {"nvim-tree/nvim-web-devicons"} }
  })

  -- remand you sig of a function.
  use {'ray-x/lsp_signature.nvim'}

  -- Debugging
  use "simrat39/rust-tools.nvim"
  use "mfussenegger/nvim-dap"
  use "theHamsta/nvim-dap-virtual-text"
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

  -- 5. project manager
  use "Shatur/neovim-session-manager"

  -- 6. cmp plugins. for completion
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/nvim-cmp"

  use 'L3MON4D3/LuaSnip' -- For luasnip users.
  use 'saadparwaiz1/cmp_luasnip'
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  use "hrsh7th/cmp-nvim-lua"

  use "ray-x/cmp-treesitter"
  use "f3fora/cmp-spell" -- spell check
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter

  use "numToStr/Comment.nvim"

  -- 8. code navigator
  use "simrat39/symbols-outline.nvim" -- outline
  use "ldelossa/litee.nvim"-- litee family
  use "ldelossa/litee-calltree.nvim"

  -- 9. git
  use "lewis6991/gitsigns.nvim"
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- l. tools
  use "folke/which-key.nvim" -- which  key
  use "phaazon/hop.nvim"-- like easymotion, but more powerful branch = "v1", -- optional but strongly recommended
  use "nvim-lualine/lualine.nvim" -- status line
  use "tpope/vim-repeat" --  . command enhance
  use "tpope/vim-surround" -- vim surround
  use "norcalli/nvim-colorizer.lua" -- show color
  use "j-hui/fidget.nvim" -- show lsp progress
  use "petertriho/nvim-scrollbar" --show search and gitsign status.
  use "dstein64/nvim-scrollview" -- a.scroll can dragged with mouth, b.handling for folds, c.Partially transparent scrollbars so that text is not covered
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  }
  -- auto resize windows
  use { "anuvyklack/windows.nvim",
    requires = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
    },
  }
  use {
    "akinsho/toggleterm.nvim", -- toggle terminal
    tag = 'v2.*',
  }
  -- currenly for bake plugin.
  use "numToStr/FTerm.nvim"
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = "nightly"
  } -- file explore

  use {
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    requires = 'kyazdani42/nvim-web-devicons',
  }
  use "lukas-reineke/indent-blankline.nvim"
  use "nvim-pack/nvim-spectre"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
