local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
  require("notify")("Installing packer close and reopen Neovim...!")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    require("notify")("Packer ls is not installed!")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
 -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter

  -- Colorschemes
  use "ellisonleao/gruvbox.nvim"
  use "folke/tokyonight.nvim"
  use "lunarvim/darkplus.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim" -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer

  -- null-ls 
  use "jose-elias-alvarez/null-ls.nvim" -- formating, diagnostics and more

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use {"nvim-telescope/telescope-fzf-native.nvim", run = 'make'}
  use "kelly-lin/telescope-ag"
  use 'ahmedkhalf/project.nvim' -- Find Projects

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"

  -- Nvim-tree
  use "kyazdani42/nvim-tree.lua"
  use "kyazdani42/nvim-web-devicons"


  -- BufferLine // TO_DO update to last version
  use { "akinsho/bufferline.nvim", commit = "06eb4ad9486bd13440ffea243ea83d314f4a8e7e" } -- Specific commit
  -- use "akinsho/bufferline.nvim"
  use "moll/vim-bbye" -- Delete buffers and other

  -- which-key
  use "folke/which-key.nvim" -- Menu helps you to find your shortcuts + execute specific commands

  -- comments
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Git
  use "lewis6991/gitsigns.nvim" -- Git signs

  -- lualine 
  use "nvim-lualine/lualine.nvim" -- Bottom bar

  -- nvim-notify
  use "rcarriga/nvim-notify" -- Notification popup

  -- toggleTerm 
  use "akinsho/toggleterm.nvim" -- Terminal 

  -- indent line
  use "lukas-reineke/indent-blankline.nvim" -- Indentation guides to all lines

  -- impatient 
  use 'lewis6991/impatient.nvim' -- Load nvim faster, install and forgot

  use 'goolord/alpha-nvim' -- Main menu 

  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlights

  use 'RRethy/vim-illuminate' -- Automatically highlighting other uses of the word under the cursor 

  use 'ThePrimeagen/harpoon' -- Toggle files and switch between them

  use 'preservim/tagbar'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

