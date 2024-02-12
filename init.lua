require("kass.luanch")
require("kass.options.options")
require("kass.options.keymaps")
require("kass.options.custom")

spec("kass.plugins.core.cmp.cmp")
spec("kass.plugins.core.cmp.copilot")
spec("kass.plugins.core.cmp.luasnip")

spec("kass.plugins.core.lsp.lsp-signature")
spec("kass.plugins.core.lsp.lspconfig")
spec("kass.plugins.core.lsp.mason")
spec("kass.plugins.core.lsp.none-ls")

spec("kass.plugins.core.equilibris")
spec("kass.plugins.core.formatter")
spec("kass.plugins.core.lint")
spec("kass.plugins.core.treesitter")
spec("kass.plugins.core.trouble")
spec("kass.plugins.core.tsc")
spec("kass.plugins.core.rest")
spec("kass.plugins.core.schemastore")

spec("kass.plugins.git.git-signs")
spec("kass.plugins.git.git-worktree")
spec("kass.plugins.git.lazy-git")

spec("kass.plugins.navigation.harpoon")
spec("kass.plugins.navigation.marks")
spec("kass.plugins.navigation.neotree")
spec("kass.plugins.navigation.telescope")

spec("kass.plugins.ui.barbecue")
spec("kass.plugins.ui.colorscheme")
spec("kass.plugins.ui.illuminate")
spec("kass.plugins.ui.indent-blankline")
spec("kass.plugins.ui.transparent")
spec("kass.plugins.ui.treesitter-context")

spec("kass.plugins.utils.comment")
spec("kass.plugins.utils.firenvim")

require("kass.lazy")
