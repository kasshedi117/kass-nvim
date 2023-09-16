local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({ "angularls", "cssls", "cssmodules_ls", "eslint", "graphql", "jsonls", "tailwindcss" })

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions

	if client.name == "tailwindcss" then
		require("telescope").load_extension("tailiscope")
		vim.keymap.set("n", "<leader>fw", "<cmd>Telescope tailiscope all<cr>")
	end

	lsp.default_keymaps({ buffer = bufnr })
	lsp.buffer_autoformat()
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

-- Fix Undefined global 'vim'
lsp.configure("lua-language-server", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
	["<Tab>"] = cmp.mapping.confirm({ select = true }),
})

-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.setup()

local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup({
	debug = true,
	autostart = true,
	-- on_attach = function(client, bufnr)
	--     -- if client.name == 'tsserver' then
	--     --     client.resolved_capabilities.document_formatting = false
	--     -- end
	--     -- if client.supports_method("textDocument/formatting") then
	--     --     vim.keymap.set("n", "<Leader>f", function()
	--     --         vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
	--     --     end, { buffer = bufnr, desc = "[lsp] format" })

	--     --     -- format on save
	--     --     vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
	--     --     vim.api.nvim_create_autocmd(event, {
	--     --         buffer = bufnr,
	--     --         group = group,
	--     --         callback = function()
	--     --             vim.lsp.buf.format({ bufnr = bufnr, async = async })
	--     --         end,
	--     --         desc = "[lsp] format on save",
	--     --     })
	--     -- end

	--     -- if client.supports_method("textDocument/rangeFormatting") then
	--     -- 	vim.keymap.set("x", "<Leader>f", function()
	--     -- 		vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
	--     -- 	end, { buffer = bufnr, desc = "[lsp] format" })
	--     -- end
	-- end,
	sources = {
		-- Replace these with the tools you have installed
		-- make sure the source name is supported by null-ls
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
	},
})

-- local lspconfig = require("lspconfig")

-- lspconfig.eslint.setup({
--     filetypes = { "html", "scss", "ts" },
--     on_attach = function(client, bufnr)
--         vim.api.nvim_create_autocmd("BufWritePre", {
--             buffer = bufnr,
--             command = "EslintFixAll",
--         })
--     end,
-- })

-- lspconfig.tsserver.setup({
--     capabilities = lsp_capabilities,
--     on_attach = function(client, bufnr)
--         lsp_zero.default_keymaps({ buffer = bufnr })
--     end,
-- })

-- --Enable (broadcasting) snippet capability for completion
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- require("lspconfig").html.setup({
--     cmd = { "vscode-html-language-server", "--stdio" },
--     capabilities = capabilities,
-- })

-- local prettier = require("prettier")

-- prettier.setup({
--     bin = "prettier", -- or `'prettierd'` (v0.23.3+)
--     filetypes = {
--         "css",
--         "graphql",
--         "html",
--         "javascript",
--         "javascriptreact",
--         "json",
--         "less",
--         "markdown",
--         "scss",
--         "typescript",
--         "typescriptreact",
--         "yaml",
--     },
--     ["null-ls"] = {
--         condition = function()
--             return prettier.config_exists({
--                 -- if `false`, skips checking `package.json` for `"prettier"` key
--                 check_package_json = true,
--             })
--         end,
--         runtime_condition = function(params)
--             -- return false to skip running prettier
--             return true
--         end,
--         timeout = 5000,
--     },
-- })

-- require("lspconfig").angularls.setup({
--     root_dir = require("lspconfig.util").root_pattern("package.json", "project.json", "angular.json"),
-- })
