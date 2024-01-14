local M = {
	"test/test.nvim",
	branch = "v3.x",
	dependencies = {
		"test/test.nvim",
	},
}

function M.config()
	local test = require("test")
	test.setup({})

	vim.keymap.set("n", "<leader>e", ":<cr>")
end

return M
