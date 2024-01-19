-- make background transparent
local M = {
	"xiyaowong/transparent.nvim",
	commit = "fd35a46f4b7c1b244249266bdcb2da3814f01724",
	lazy = false,
	priority = 1000,
	name = "transparent",
}

function M.config()
	local transparent = require("transparent")
	transparent.setup({
		groups = { -- table: default groups
			"Normal",
			"NormalNC",
			"Comment",
			"Constant",
			"Special",
			"Identifier",
			"Statement",
			"PreProc",
			"Type",
			"Underlined",
			"Todo",
			"String",
			"Function",
			"Conditional",
			"Repeat",
			"Operator",
			"Structure",
			"LineNr",
			"NonText",
			"SignColumn",
			"CursorLine",
			"CursorLineNr",
			"StatusLine",
			"StatusLineNC",
			"EndOfBuffer",
		},
		extra_groups = {
			"NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
			"NvimTreeNormal", -- NvimTree
		}, -- table: additional groups that should be cleared
		exclude_groups = {}, -- table: groups you don't want to clear
	})

	transparent.clear_prefix("NeoTree")
	transparent.clear_prefix("BufferLine")
	-- transparent.clear_prefix("lualine")
end

return M
