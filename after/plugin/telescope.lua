local builtin = require("telescope.builtin")
require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("tailiscope")
require("telescope").load_extension("zoxide")

-- Useful for easily creating commands
local z_utils = require("telescope._extensions.zoxide.utils")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fj", builtin.git_files, {})
-- "test" -tts
-- vim.keymap.set("n", "<leader>fg", builtin.live_grep_args(), {})
vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", {})
vim.keymap.set("v", "<leader>fg", builtin.grep_string, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})
-- vim.keymap.set("n", "<leader>fa", builtin.marks, {})
vim.keymap.set("n", "<leader>fz", require("telescope").extensions.zoxide.list)

-- vim.keymap.set('n', '<leader>ps', function()
--     builtin.grep_string({ search = vim.fn.input("Grep > ") });
-- end)

require("telescope").setup({
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		zoxide = {
			prompt_title = "[ Walking on the shoulders of TJ ]",
			mappings = {
				default = {
					after_action = function(selection)
						print("Update to (" .. selection.z_score .. ") " .. selection.path)
					end,
				},
				["<C-s>"] = {
					before_action = function(selection)
						print("before C-s")
					end,
					action = function(selection)
						vim.cmd.edit(selection.path)
					end,
				},
				-- Opens the selected entry in a new split
				["<C-q>"] = { action = z_utils.create_basic_command("split") },
			},
		},
	},
	defaults = {
		layout_config = {
			width = 0.99,
			prompt_position = "bottom",
			preview_cutoff = 10,
			horizontal = { width = 0.99, height = 0.99, mirror = false },
			vertical = { width = 0.99, height = 0.99, mirror = false },
			cursor = { width = 0.9, height = 0.9 },
		},
		find_command = {
			"rg",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = " ",
		selection_caret = " ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "vertical",
		file_ignore_patterns = {},
		path_display = { "smart" },
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
	},
})
