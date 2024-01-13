return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim", -- Power telescope with FZF
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-rg.nvim",
			"nvim-telescope/telescope-node-modules.nvim",
		},
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<Esc>"] = require("telescope.actions").close, -- don't go into normal mode, just close
							["<C-j>"] = require("telescope.actions").move_selection_next, -- scroll the list with <c-j>
							["<C-k>"] = require("telescope.actions").move_selection_previous, -- scroll the list with <c-k>
							-- ["<C-\\->"] = actions.select_horizontal, -- open selection in new horizantal split
							-- ["<C-\\|>"] = actions.select_vertical, -- open selection in new vertical split
							["<C-t>"] = require("telescope.actions").select_tab, -- open selection in new tab
							["<C-y>"] = require("telescope.actions").preview_scrolling_up,
							["<C-e>"] = require("telescope.actions").preview_scrolling_down,
						},
					},
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--trim",
					},
					prompt_prefix = "   ",
					selection_caret = "  ",
					entry_prefix = "  ",
					initial_mode = "insert",
					selection_strategy = "reset",
					sorting_strategy = "descending",
					layout_strategy = "vertical",
					layout_config = {
						width = 0.99,
						prompt_position = "bottom",
						preview_cutoff = 10,
						horizontal = { width = 0.99, height = 0.99, mirror = false },
						vertical = { width = 0.99, height = 0.99, mirror = false },
						cursor = { width = 0.9, height = 0.9 },
					},
					file_sorter = require("telescope.sorters").get_fuzzy_file,
					file_ignore_patterns = { "node_modules" },
					generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
					path_display = { "smart" },
					winblend = 0,
					border = {},
					borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					color_devicons = true,
					use_less = true,
					set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
					grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
					qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
					-- Developer configurations: Not meant for general override
					buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
				},
				pickers = { find_files = { find_command = { "fd", "--type", "f", "--hidden", "--strip-cwd-prefix" } } },
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})

			require("legendary").keymaps({
				itemgroup = "Telescope",
				icon = "",
				description = "Telescope...",
				keymaps = {
					{
						"<leader>ff",
						"<cmd>Telescope find_files<CR>",
						description = "Find files",
					},
					{
						"<leader>fg",
						"<cmd>Telescope live_grep<CR>",
						description = "Find in files",
					},
					{
						"<leader>fG",
						"<cmd>Telescope git_files<CR>",
						description = "Find in files",
					},
					{
						"<leader>fb",
						"<cmd>Telescope buffers<CR>",
						description = "Find buffers",
					},
					{
						"<leader>fo",
						"<cmd>Telescope oldfiles<CR>",
						description = "Find oldfiles",
					},
					{
						"<leader>fn",
						"<cmd>Telescope node_modules list<CR>",
						description = "Find node_modules",
					},
					{
						"<leader>fl",
						"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
						description = "Find in file live grep",
					},
					{
						"<leader>fh",
						"<cmd>Telescope help_tags<CR>",
						description = "Find help_tags",
					},
					-- {
					-- 	"<leader>pa",
					-- 	function()
					-- 		require("telescope.builtin").grep_string()
					-- 	end,
					-- 	description = "Find help_tags",
					-- },
					{
						"<leader>fd",
						function()
							require("telescope.builtin").grep_string()
						end,
						description = "Find help_tags",
					},
					{
						"<leader>fu",
						function()
							require("telescope.builtin").grep_string()
						end,
						description = "Find help_tags",
					},
					-- {
					-- 	"<leader>pe",
					-- 	function()
					-- 		require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
					-- 	end,
					-- 	description = "Find help_tags",
					-- },
					-- {
					-- 	"<leader>pa",
					-- 	function()
					-- 		local world = vim.fn.expand("<cword>")
					-- 		require("telescope.builtin").grep_string({ search = world })
					-- 	end,
					-- 	description = "Find help_tags",
					-- },
					-- {
					-- 	"<leader>pz",
					-- 	function()
					-- 		local world = vim.fn.expand("<cWORD>")
					-- 		require("telescope.builtin").grep_string({ search = world })
					-- 	end,
					-- 	description = "Find help_tags",
					-- },
				},
			})
		end,
	},
}
