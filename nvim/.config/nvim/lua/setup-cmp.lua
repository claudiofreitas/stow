local cmp = require('cmp')
local luasnip = require('luasnip')

-- https://github.com/onsails/lspkind.nvim
local lspkind = require('lspkind')

-- Demo: https://www.youtube.com/watch?v=_DnmphIwnjo
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol_text',
			menu = {
				-- buffer = '[buf]',
				nvim_lsp = '[LSP]',
				nvim_lua = '🌙',
				luasnip = '[luasnip]',
			},
		}),
	},

	window = {},

	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),

	-- Add sources in order of priority
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		-- { name = 'luasnip' },
	}),
})

-- require('cmp').setup({
--   enabled = true,
--   autocomplete = true,
--   debug = false,
--   min_length = 1,
--   preselect = "enable",
--   throttle_time = 80,
--   source_timeout = 200,
--   incomplete_delay = 400,
--   max_abbr_width = 100,
--   max_kind_width = 100,
--   max_menu_width = 100,
--   source = {
--     path = true,
--     buffer = true,
--     calc = true,
--     vsnip = true,
--     nvim_lsp = true,
--     nvim_lua = true,
--     spell = true,
--     tags = true,
--     snippets_nvim = true,
--     treesitter = true
--   }
-- })