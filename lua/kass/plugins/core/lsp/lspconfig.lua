local M = {
	"neovim/nvim-lspconfig",
	commit = "042aa6b27b8b8d4f4e1bd42de2037c83d676a8a0",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"folke/neodev.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"danielvolchek/tailiscope.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
}

function M.config()
	local lspconfig = require("lspconfig")
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local opts = { noremap = true, silent = true }

	local on_attach = function(client, bufnr)
		opts.buffer = bufnr

		if client.name == "tailwindcss" then
			require("telescope").load_extension("tailiscope")
			vim.keymap.set("n", "<leader>fz", "<cmd>Telescope tailiscope all<cr>")
		end

		opts.desc = "Show LSP references"
		vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

		opts.desc = "Go to declaration"
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

		opts.desc = "Show LSP definitions"
		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

		opts.desc = "Show LSP implementations"
		vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

		opts.desc = "Show LSP type definitions"
		vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

		opts.desc = "See available code actions"
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

		opts.desc = "Smart rename"
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

		opts.desc = "Show buffer diagnostics"
		vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

		opts.desc = "Show line diagnostics"
		vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts) -- show diagnostics for line

		opts.desc = "Go to previous diagnostic"
		vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

		opts.desc = "Go to next diagnostic"
		vim.keymap.set("n", "gn", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

		opts.desc = "Show documentation for what is under cursor"
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

		opts.desc = "Restart LSP"
		vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
	end

	-- used to enable autocompletion (assign to every lsp server config)
	local capabilities = cmp_nvim_lsp.default_capabilities()

	-- Change the Diagnostic symbols in the sign column (gutter)
	-- (not in youtube nvim video)
	local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local border = {
		{ "╭", "FloatBorder" },
		{ "─", "FloatBorder" },
		{ "╮", "FloatBorder" },
		{ "│", "FloatBorder" },
		{ "╯", "FloatBorder" },
		{ "─", "FloatBorder" },
		{ "╰", "FloatBorder" },
		{ "│", "FloatBorder" },
	}

	-- LSP settings (for overriding per client)
	local handlers = {
		["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
		["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
	}

	-- configure html server
	lspconfig["html"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		handlers = handlers,
	})

	-- tsserver = {
	-- 	root_dir = function(...)
	-- 		return require("lspconfig.util").root_pattern(".git")(...)
	-- 	end,
	-- 	single_file_support = false,
	-- 	settings = {
	-- 		typescript = {
	-- 			inlayHints = {
	-- 				includeInlayParameterNameHints = "literal",
	-- 				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
	-- 				includeInlayFunctionParameterTypeHints = true,
	-- 				includeInlayVariableTypeHints = false,
	-- 				includeInlayPropertyDeclarationTypeHints = true,
	-- 				includeInlayFunctionLikeReturnTypeHints = true,
	-- 				includeInlayEnumMemberValueHints = true,
	-- 			},
	-- 		},
	-- 		javascript = {
	-- 			inlayHints = {
	-- 				includeInlayParameterNameHints = "all",
	-- 				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
	-- 				includeInlayFunctionParameterTypeHints = true,
	-- 				includeInlayVariableTypeHints = true,
	-- 				includeInlayPropertyDeclarationTypeHints = true,
	-- 				includeInlayFunctionLikeReturnTypeHints = true,
	-- 				includeInlayEnumMemberValueHints = true,
	-- 			},
	-- 		},
	-- 	},
	-- },

	-- configure typescript server with plugin
	local util = require("lspconfig.util")
	lspconfig["angularls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		handlers = handlers,
		-- root_dir = util.root_pattern("project.json"),
		-- root_dir = function(...)
		-- 	return require("lspconfig.util").root_pattern(".git")(...)
		-- end,
		root_dir = util.root_pattern(".git", ".project"),
	})

	lspconfig["tsserver"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		handlers = handlers,
	})

	-- configure css server
	lspconfig["cssls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		handlers = handlers,
	})

	-- configure tailwindcss server
	lspconfig["tailwindcss"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		handlers = handlers,
	})

	-- configure svelte server
	lspconfig["svelte"].setup({
		capabilities = capabilities,
		handlers = handlers,
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)

			vim.api.nvim_create_autocmd("BufWritePost", {
				pattern = { "*.js", "*.ts" },
				callback = function(ctx)
					if client.name == "svelte" then
						client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
					end
				end,
			})
		end,
	})

	-- configure prisma orm server
	lspconfig["prismals"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		handlers = handlers,
	})

	-- configure graphql language server
	lspconfig["graphql"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		handlers = handlers,
		filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
	})

	-- configure emmet language server
	lspconfig["emmet_ls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		handlers = handlers,
		filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
	})

	-- configure python server
	lspconfig["pyright"].setup({
		capabilities = capabilities,
		handlers = handlers,
		on_attach = on_attach,
	})

	-- configure lua server (with special settings)
	lspconfig["lua_ls"].setup({
		require("neodev").setup({}),
		capabilities = capabilities,
		handlers = handlers,
		on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})
end

return M
