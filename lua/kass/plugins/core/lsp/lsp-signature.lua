local M = {
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	opts = {},
}

function M.config(_, opts)
	require("lsp_signature").setup(opts)
end

return M
