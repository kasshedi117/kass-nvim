local M = {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
}

function M.config()
	require("ibl").setup({
		indent = { char = "│" },
		scope = {
			enabled = true,
			show_start = false,
			show_end = false,
			char = "┃",
		},
	})
end

return M
