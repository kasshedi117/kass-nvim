local M = {
	"lukas-reineke/indent-blankline.nvim",
	versoin = "Version 3.5.2",
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
