-- https://github.com/marko-cerovac/material.nvim
vim.g.material_style = 'darker'

local materialColors = require('material.colors')

require('material').setup({
	high_visibility = {
		lighter = false,
		darker = true,
	},

	custom_highlights = {
		Normal = { bg = 'None' },
		LineNr = { bg = 'None' },
		SignColumn = { bg = 'None' },
		CursorLineNr = { bg = 'None' },
		CursorLine = { bg = '#121212' },
		GitSignsAdd = { bg = 'None', fg = '#c3e88d' },
		GitSignsDelete = { bg = 'None', fg = '#f07178' },
		['@keyword'] = { fg = materialColors.main.purple },
		['@include'] = { fg = materialColors.main.purple },
		['@parameter'] = { fg = materialColors.syntax.value },
	},

	disable = {
		colored_cursor = true,
		background = false,
	},
})
vim.api.nvim_command('colorscheme material')
