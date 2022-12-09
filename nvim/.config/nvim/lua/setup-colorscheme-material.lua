-- https://github.com/marko-cerovac/material.nvim
vim.g.material_style = 'darker'

local material_colors = require('material.colors')

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
		GitSignsAdd = { fg = '#547722', bg = 'None' },
		GitSignsChange = { fg = '#571980', bg = 'None' },
		GitSignsDelete = { fg = '#ff0000', bg = 'None' },
		['@keyword'] = { fg = material_colors.main.purple },
		['@include'] = { fg = material_colors.main.purple },
		['@parameter'] = { fg = material_colors.syntax.value },
	},

	disable = {
		colored_cursor = true,
		background = false,
	},
})
vim.api.nvim_command('colorscheme material')
