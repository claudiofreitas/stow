-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#snippets
-- [The Ultimate LuaSnip Tutorial for Beginners](https://www.youtube.com/watch?v=ub0REXjhpmk)

local luasnip = require('luasnip')

require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/snippets' })

luasnip.config.set_config({
	history = true,
	updateevents = 'TextChanged,TextChangedI',
	enable_autosnippets = false, -- Lets leave this false for now
	ext_opts = {
		[require('luasnip.util.types').choiceNode] = {
			active = {
				virt_text = { { '●', 'DiagnosticSignHint' } },
			},
		},
	},
})
