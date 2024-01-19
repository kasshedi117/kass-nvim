local M = {
	"mfussenegger/nvim-lint",
	commit = "b32127ba52f3a1f7dc86773c2ca3f0029afa12c1",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
}

function M.config()
	local lint = require("lint")

	lint.linters_by_ft = {
		javascript = { "eslint" },
		typescript = { "eslint" },
		javascriptreact = { "eslint" },
		typescriptreact = { "eslint" },
		svelte = { "eslint" },
	}

	local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
		group = lint_augroup,
		callback = function()
			lint.try_lint()
		end,
	})

	vim.keymap.set("n", "<leader>l", function()
		lint.try_lint()
	end, { desc = "Trigger linting for current file" })
end

return M
