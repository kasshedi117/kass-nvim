local M = {
	"zbirenbaum/copilot.lua",
	dependencies = {
		"zbirenbaum/copilot-cmp",
	},
	cmd = "Copilot",
	event = "InsertEnter",
}

function M.config()
	local copilot = require("copilot")
	local copilot_cmp = require("copilot_cmp")
	copilot.setup({
		panel = {
			enabled = false,
			auto_refresh = false,
			keymap = {
				jump_prev = "]]",
				jump_next = "[[",
				accept = "<CR>",
				refresh = "gr",
				open = "<M-CR>",
			},
			layout = {
				position = "bottom", -- | top | left | right
				ratio = 0.4,
			},
		},
		suggestion = {
			enabled = false,
			auto_trigger = true,
			debounce = 75,
			keymap = {
				accept = "<tab>",
				accept_word = false,
				accept_line = false,
				next = "<C-j>",
				prev = "<C-k>",
				dismiss = "<C-]>",
			},
		},
		filetypes = {
			yaml = false,
			markdown = false,
			help = false,
			gitcommit = false,
			gitrebase = false,
			hgcommit = false,
			svn = false,
			cvs = false,
			["."] = false,
		},
		copilot_node_command = "node", -- Node.js version must be > 18.x
		server_opts_overrides = {},
	})
	copilot_cmp.setup()
end

return M
