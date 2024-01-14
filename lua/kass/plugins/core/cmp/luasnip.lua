local M = {
	"L3MON4D3/LuaSnip",
	priority = 100,
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
}

function M.config()
	local ls = require("luasnip")
	ls.config.set_config({
		enable_autosnippets = false,
	})
	local s = ls.snippet
	local t = ls.text_node
	local i = ls.insert_node
	-- local func = ls.function_node
	local extras = require("luasnip.extras")
	local rep = extras.rep

	-- local date = function()
	-- 	return { os.date("%Y-%m-%d") }
	-- end

	ls.add_snippets("typescript", {
		s({
			trig = "console.log",
			name = "kass.log",
			desc = "my custom log",
		}, {
			t('console.log("'),
			rep(1),
			t('");'),
			t({ "", "" }),
			i(0),
			t("console.log("),
			i(1),
			t(");"),
		}),
	})
end

return M
