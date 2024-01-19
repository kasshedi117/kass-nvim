local M = {
	"williamboman/mason.nvim",
	version = "v1.9.0",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"j-hui/fidget.nvim",
	},
}

function M.config()
	local fidget = require("fidget")
	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")
	local mason_tool_installer = require("mason-tool-installer")

	fidget.setup()
	mason.setup({
		ui = {
			border = "rounded",
		},
	})

	mason_lspconfig.setup({
		-- list of servers for mason to install
		ensure_installed = {
			"tsserver",
			"angularls",
			"html",
			"cssls",
			"tailwindcss",
			"lua_ls",
			"jsonls",
			"emmet_ls",
		},
		-- auto-install configured servers (with lspconfig)
		automatic_installation = true, -- not the same as ensure_installed
	})

	mason_tool_installer.setup({
		ensure_installed = {
			"prettier", -- prettier formatter
			"stylua", -- lua formatter
			"eslint", -- js linter
		},
	})
end

return M
