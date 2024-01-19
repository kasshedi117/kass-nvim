-- line in the top fileName->function->subfunction
local M = {
	"utilyre/barbecue.nvim",
	commit = "d38a2a023dfb1073dd0e8fee0c9be08855d3688f",
	name = "barbecue",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	opts = {
		-- configurations go here
	},
}

function M.config()
	require("barbecue").setup({})
end

return M
