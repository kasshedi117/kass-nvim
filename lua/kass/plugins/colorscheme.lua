return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				integrations = {
					cmp = true,
					gitsigns = true,
					treesitter = true,
					harpoon = true,
					neotree = false,
					telescope = {
						enabled = true,
					},
					which_key = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
						inlay_hints = {
							background = true,
						},
						transparent = vim.g.transparent_enabled,
					},
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			})
			vim.cmd.colorscheme("catppuccin")
			-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},

	-- {
	-- 	"bluz71/vim-nightfly-guicolors",
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		-- load the colorscheme here
	-- 		vim.cmd([[colorscheme nightfly]])
	-- 		-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- 		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- 	end,
	-- },
	--
	--
	--
	--
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		-- local bg = "#011628"
	-- 		-- local bg_dark = "#011423"
	-- 		-- local bg_highlight = "#143652"
	-- 		-- local bg_search = "#0A64AC"
	-- 		-- local bg_visual = "#275378"
	-- 		-- local fg = "#CBE0F0"
	-- 		-- local fg_dark = "#B4D0E9"
	-- 		-- local fg_gutter = "#627E97"
	-- 		-- local border = "#547998"
	-- 		--
	-- 		-- require("tokyonight").setup({
	-- 		-- 	style = "night",
	-- 		-- 	on_colors = function(colors)
	-- 		-- 		colors.bg = bg
	-- 		-- 		colors.bg_dark = bg_dark
	-- 		-- 		colors.bg_float = bg_dark
	-- 		-- 		colors.bg_highlight = bg_highlight
	-- 		-- 		colors.bg_popup = bg_dark
	-- 		-- 		colors.bg_search = bg_search
	-- 		-- 		colors.bg_sidebar = bg_dark
	-- 		-- 		colors.bg_statusline = bg_dark
	-- 		-- 		colors.bg_visual = bg_visual
	-- 		-- 		colors.border = border
	-- 		-- 		colors.fg = fg
	-- 		-- 		colors.fg_dark = fg_dark
	-- 		-- 		colors.fg_float = fg
	-- 		-- 		colors.fg_gutter = fg_gutter
	-- 		-- 		colors.fg_sidebar = fg_dark
	-- 		-- 	end,
	-- 		-- })
	-- 		-- -- load the colorscheme here
	-- 		vim.cmd([[colorscheme tokyonight]])
	-- 	end,
	-- },
	--
	--

	-- {
	-- 	"morhetz/gruvbox",
	-- 	name = "gruvbox",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme gruvbox]])
	-- 	end,
	-- },
	--
	-- {
	-- 	"dracula/vim",
	-- 	name = "dracula",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme dracula]])
	-- 	end,
	-- },

	-- {
	-- 	"shaunsingh/solarized.nvim",
	-- 	name = "solarized",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme solarized]])
	-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- 	end,
	-- },
}
