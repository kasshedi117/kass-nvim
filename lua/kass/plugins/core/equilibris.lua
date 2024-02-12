local M = {
	-- "Equilibris/nx.nvim",
	"Sewb21/nx.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},

	opts = {
		nx_cmd_root = "npx nx",
	},
}

function M.config()
	local nx = require("nx")
	nx.setup({})

	vim.keymap.set("n", "<leader>fx", ":Telescope nx generators<cr>")
end

return M
