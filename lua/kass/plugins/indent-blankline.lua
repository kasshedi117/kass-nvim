return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		require("ibl").setup({
			indent = { char = "│" },
			scope = {
				enabled = true,
				show_start = false,
				show_end = false,
				char = "┃",
			},
		})
	end,
}
