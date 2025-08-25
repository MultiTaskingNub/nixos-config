return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				["<Tab>"] = { "select_and_accept", "fallback" },
			},

			appearance = {
				nerd_font_variant = "mono",
			},

			completion = {
				documentation = { auto_show = true },
				menu = {
					border = "rounded",
				},
				ghost_text = {
					enabled = true,
				},
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			fuzzy = {
				implementation = "lua",
				sorts = {
					"exact",
					-- defaults
					"score",
					"sort_text",
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}
