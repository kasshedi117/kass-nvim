local M = {
	"dmmulroy/tsc.nvim",
	version = "v2.0.0",
}

function M.config()
	require("tsc").setup()
	vim.keymap.set("n", "<leader>1", "<Plug>RestNvim<cr>")
end

return M
