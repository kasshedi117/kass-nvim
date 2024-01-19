local M = {
	"ray-x/lsp_signature.nvim",
	commit = "fed2c8389c148ff1dfdcdca63c2b48d08a50dea0",
	event = "VeryLazy",
	opts = {},
}

function M.config(_, opts)
	require("lsp_signature").setup(opts)
end

return M
