return {
	"nvim-treesitter/nvim-treesitter-context",
	name = "nvim-treesitter-context",

	config = function()
		require("treesitter-context").setup({
			enable = true,
			max_lines = 5,
			trim_scope = "outer",
			patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
				-- For all filetypes
				-- Note that setting an entry here replaces all other patterns for this entry.
				-- By setting the 'default' entry below, you can control which nodes you want to
				-- appear in the context window.
				default = {
					"class",
					"function",
					"method",
					"for", -- These won't appear in the context
					"while",
					"if",
					"switch",
					"case",
					"element",
					"call",
				},
			},
			exact_patterns = {},

			zindex = 20, -- The Z-index of the context window
			mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
			separator = nil, -- Separator between context and content. Should be a single character string, like '-'.
		})
	end,
}
