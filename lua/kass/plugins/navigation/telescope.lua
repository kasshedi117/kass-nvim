local M = {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim", -- Power telescope with FZF
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-rg.nvim",
		"nvim-telescope/telescope-node-modules.nvim",
		"ThePrimeagen/git-worktree.nvim",
	},
}

function M.config()
	local telescope = require("telescope")
	local lga_actions = require("telescope-live-grep-args.actions")
	telescope.setup({
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
		pickers = {
			find_files = {
				find_command = {
					"fd",
					"--type",
					"f",
					"--hidden",
					"--strip-cwd-prefix",
				},
				mappings = {
					n = {
						["cd"] = function(prompt_bufnr)
							local selection = require("telescope.actions.state").get_selected_entry()
							local dir = vim.fn.fnamemodify(selection.path, ":p:h")
							require("telescope.actions").close(prompt_bufnr)
							-- Depending on what you want put `cd`, `lcd`, `tcd`
							vim.cmd(string.format("silent lcd %s", dir))
						end,
					},
				},
			},
		},
		extensions = {
			live_grep_args = {
				auto_quoting = true,
				mappings = {
					i = {
						["<C-h>"] = lga_actions.quote_prompt({ postfix = " --iglob *html" }),
						["<C-l>"] = lga_actions.quote_prompt({ postfix = " --iglob *ts" }),
					},
				},
			},
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	})
	require("telescope").load_extension("fzf")

	vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
	vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
	vim.keymap.set("n", "<leader>fG", "<cmd>Telescope git_files<CR>")
	vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
	vim.keymap.set("n", "<leader>fn", "<cmd>Telescope node_modules list<CR>")
	vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
	vim.keymap.set("n", "<leader>fz", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
	vim.keymap.set("n", "<leader>fa", "lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")
end

return M
