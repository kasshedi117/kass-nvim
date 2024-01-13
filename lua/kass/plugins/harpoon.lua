return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = true,
	init = function()
		local harpoon = require("harpoon")
		harpoon:setup()
		require("legendary").keymaps({
			itemgroup = "Harpoon",
			icon = "󱡅",
			description = "Harpoon...",
			keymaps = {
				{
					"<leader>a",
					function()
						require("harpoon"):list():append()
					end,
					description = "Add mark",
				},
				{
					"<leader>z",
					function()
						harpoon.ui:toggle_quick_menu(harpoon:list())
					end,
					description = "Browse marks",
				},
				{
					"<leader>u",
					function()
						harpoon:list():select(1)
					end,
					description = "Select marks 1",
				},
				{
					"<leader>i",
					function()
						harpoon:list():select(2)
					end,
					description = "Select marks 2",
				},
				{
					"<leader>o",
					function()
						harpoon:list():select(3)
					end,
					description = "Select marks 3",
				},
				{
					"<leader>p",
					function()
						harpoon:list():select(4)
					end,
					description = "Select marks 4",
				},
			},
		})
	end,
}
