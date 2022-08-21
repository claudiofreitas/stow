local cmp = require('cmp')
local luasnip = require('luasnip')

-- https://github.com/onsails/lspkind.nvim
local lspkind = require('lspkind')

-- Demo: https://www.youtube.com/watch?v=_DnmphIwnjo
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },

  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      menu = ({
        -- buffer = '[buf]',
        nvim_lsp = '[LSP]',
        nvim_lua = '[n-lua]',
        luasnip = '[luasnip]',
      }),
    })
  },

  window = {},

  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),

  -- Add sources in order of priority
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'nvim_lua' },
    -- { name = 'luasnip' },
  })
})
