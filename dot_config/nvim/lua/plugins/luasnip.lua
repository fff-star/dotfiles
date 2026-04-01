return {
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		config = function()
			local ls = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
			require("luasnip.loaders.from_lua").load({ paths = "./LuaSnip" })
			require("luasnip").config.set_config({
				enable_autosnippets = true,
				store_selection_keys = "<Tab>",
			})
			vim.keymap.set({ "i", "s" }, "<C-f>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<C-b>", function()
				if ls.choice_active() then
					ls.change_choice(-1)
				end
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<C-k>", function()
				if ls.expandable() then
					ls.expand()
				end
			end, { silent = true })
		end,
	},
}
