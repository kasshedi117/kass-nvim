local M = {
	"folke/trouble.nvim",
	version = "v2.10.0",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/lsp-colors.nvim" },
}

function M.config()
	require("trouble").setup({
		group = false,
		multiline = false,
		height = 6,
	})
	vim.keymap.set("n", "<leader>tt", function()
		require("trouble").toggle()
	end)
	vim.keymap.set("n", "<leader>tn", function()
		require("trouble").next({ skip_group = true, jump = true })
	end)
	vim.keymap.set("n", "<leader>tp", function()
		require("trouble").previous({ skip_group = true, jump = true })
	end)
end

return M
