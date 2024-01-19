local M = {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	commit = "2cd4e03372f7ee5692c8caa220f479ea07970f17",
	dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
	local harpoon = require("harpoon")
	harpoon:setup()
	vim.keymap.set("n", "<leader>a", function()
		harpoon:list():append()
	end)
	vim.keymap.set("n", "<leader>w", function()
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end)

	vim.keymap.set("n", "<leader>u", function()
		harpoon:list():select(1)
	end)
	vim.keymap.set("n", "<leader>i", function()
		harpoon:list():select(2)
	end)
	vim.keymap.set("n", "<leader>o", function()
		harpoon:list():select(3)
	end)
	vim.keymap.set("n", "<leader>p", function()
		harpoon:list():select(4)
	end)
	vim.keymap.set("n", "<leader>y", function()
		harpoon:list():select(5)
	end)
end

return M
