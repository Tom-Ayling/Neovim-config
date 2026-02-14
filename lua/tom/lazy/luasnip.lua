return {
	{
		"L3MON4D3/LuaSnip",
		version = "2.*",
		build = (function()
			return "make install_jsregexp"
		end)(),
		dependencies = {
			{
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
		},

		config = function()
			local snippet_path = vim.fn.stdpath("config") .. "/luasnip"
			require("luasnip.loaders.from_lua").lazy_load({
				paths = { snippet_path },
			})

			local ls = require("luasnip")

			ls.setup({
				history = true,
				update_events = "TextChanged,TextChangedI",
			})

			-- Change Choice (for choice nodes)
			vim.keymap.set({ "i", "s" }, "<c-l>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { silent = true })
		end,
	},
}
