-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#snippets
-- [The Ultimate LuaSnip Tutorial for Beginners](https://www.youtube.com/watch?v=ub0REXjhpmk)
-- [A LuaSnip guide for LaTeX workflows](https://www.ejmastnak.com/tutorials/vim-latex/luasnip.html)

local ok, luasnip = pcall(require, 'luasnip')
if not ok then
	print('error on trying to load luasnip')
	return nil
end

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
