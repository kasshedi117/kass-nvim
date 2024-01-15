local M = {
	"nvim-neo-tree/neo-tree.nvim",
	priority = 100,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
}

function M.config()
	local neo_tree = require("neo-tree")
	neo_tree.setup({
		use_default_mappings = false,
		default_component_configs = {
			indent = {
				indent_size = 2,
			},
		},
		window = {
			width = 40,
			mappings = {
				["<2-LeftMouse>"] = "open",
				["<esc>"] = "cancel", -- close preview or floating neo-tree window
				["v"] = "open_vsplit",
				["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
				["a"] = {
					"add",
					-- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
					-- some commands may take optional config options, see `:h neo-tree-mappings` for details
					config = {
						show_path = "none", -- "none", "relative", "absolute"
					},
				},
				["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
				["d"] = "delete",
				["r"] = "rename",
				["y"] = "copy_to_clipboard",
				["x"] = "cut_to_clipboard",
				["p"] = "paste_from_clipboard",
				["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
				-- ["c"] = {
				--  "copy",
				--  config = {
				--    show_path = "none" -- "none", "relative", "absolute"
				--  }
				--}
				["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
				["q"] = "close_window",
				["R"] = "refresh",
				["?"] = "show_help",
				["H"] = "prev_source",
				["L"] = "next_source",
				["i"] = "toggle_hidden",
				-- ["f"] = "fuzzy_finder",
				-- ["F"] = "fuzzy_finder_directory",
				["o"] = "open",
				["<cr>"] = "open",
				["f"] = function(state)
					local current_node = state.tree:get_node() -- this is the current node
					local path = current_node:get_id() -- this gives you the path
					local searchIn = "find files in " .. path
					require("telescope.builtin").find_files({
						prompt_title = searchIn,
						cwd = path,
					})
				end,
				["F"] = function(state)
					local current_node = state.tree:get_node() -- this is the current node
					local path = current_node:get_id() -- this gives you the path
					local searchIn = "find world in " .. path
					require("telescope").extensions.live_grep_args.live_grep_args({
						prompt_title = searchIn,
						cwd = path,
					})
				end,
			},
		},
		filesystem = {
			follow_current_file = {
				enabled = true, -- This will find and focus the file in the active buffer every time
				leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
			},
			window = {
				mappings = {},
			},
			buffers = {
				window = {
					mappings = {},
				},
			},
			git_status = {
				window = {
					mappings = {},
				},
			},
		},
	})

	vim.keymap.set("n", "<leader>e", ":Neotree source=last toggle reveal<cr>")
end

return M
