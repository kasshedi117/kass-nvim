vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-live-grep-args.nvim" } },
	})

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("danielvolchek/tailiscope.nvim")

	-- use("nanotee/zoxide.vim")
	use("jvgrootveld/telescope-zoxide")

	-- use("junegunn/fzf.vim")
	-- use("usr/bin/fzf")

	-- colorscheme
	-- use { 'rose-pine/neovim', as = 'rose-pine' }
	use({ "folke/tokyonight.nvim" })
	-- use { 'navarasu/onedark.nvim' }

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({ "theprimeagen/harpoon" })
	use({ "mbbill/undotree" })
	use({ "tpope/vim-fugitive" })
	use({ "lewis6991/gitsigns.nvim" })

	use({ "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } })

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",

		requires = {

			{ "jose-elias-alvarez/null-ls.nvim" },
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },

			-- prettier
			{ "MunifTanjim/prettier.nvim" },

			{ "MunifTanjim/eslint.nvim" },

			{ "mhartington/formatter.nvim" },
		},
	})

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})

	-- Comment
	use({
		"numToStr/Comment.nvim",
		requires = {
			use("JoosepAlviste/nvim-ts-context-commentstring"),
		},
	})
end)
