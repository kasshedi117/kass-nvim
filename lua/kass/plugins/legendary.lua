return {
	"mrjones2014/legendary.nvim",
	priority = 10000,
	lazy = false,
	config = function()
		require("legendary").setup({
			keymaps = {
				-- Legendary
				{ "<leader>ll", ":Legendary<CR>", description = "Find Legendary" },
				{ "<leader>lk", ":Legendary keymaps<CR>", description = "Find Legendary keymaps" },
				{ "<leader>lc", ":Legendary commands<CR>", description = "Find Legendary commands" },
				{ "<leader>lf", ":Legendary functions<CR>", description = "Find Legendary functions" },
				{ "<leader>la", ":Legendary autocmds<CR>", description = "Find Legendary autocmds" },

				-- Worktree
				{
					"<leader>fz",
					":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
					description = "Find git worktrees",
				},
				{
					"<leader>fa",
					":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
					description = "Create git worktree",
				},

				-- Session
				{
					"<leader>wr",
					"<cmd>SessionRestore<CR>",
					description = "Restore session for cwd",
				}, -- restore last workspace session for current directory
				{
					"<leader>ws",
					"<cmd>SessionSave<CR>",
					description = "Save session for auto session root dir",
				}, -- save workspace session for current working directory

				-- NeoTree
				{
					"<leader>e",
					"<cmd>Neotree toggle<CR>",
					description = "Toggle Neotree",
				},
			},
			commands = {
				-- easily create user commands
				{
					":SayHello",
					function()
						print("hello world!")
					end,
					description = "Say hello as a command",
				},
			},
			funcs = {},
			autocmds = {},
			extensions = {},
			select_prompt = " legendary.nvim ",
			scratchpad = {
				-- How to open the scratchpad buffer,
				-- 'current' for current window, 'float'
				-- for floating window
				view = "current",
				-- How to show the results of evaluated Lua code.
				-- 'print' for `print(result)`, 'float' for a floating window.
				results_view = "current",
				-- Border style for floating windows related to the scratchpad
				-- float_border = "rounded",
				fload_border = "rounded",
				-- Whether to restore scratchpad contents from a cache file
				keep_contents = true,
			},
		})
	end,
}
