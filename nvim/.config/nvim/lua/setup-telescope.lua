local ok, telescope_config = pcall(require, 'telescope.config')
if not ok then
	print('error on trying to load telescope')
	return nil
end

local vimgrep_arguments = {
	unpack(telescope_config.values.vimgrep_arguments),
}
table.insert(vimgrep_arguments, '--hidden')
table.insert(vimgrep_arguments, '--glob')
table.insert(vimgrep_arguments, '!.git/*')

-- Telescope
require('telescope').setup({
	defaults = {
		-- prompt_prefix = '🔭 ',
		prompt_prefix = '  ',
		-- prompt_prefix = '🔎 ',
		winblend = 0,
		sorting_strategy = 'ascending',
		anchor = 'CENTER',
		layout_config = {
			prompt_position = 'top',
		},
		color_devicons = true,
	},

	pickers = {
		defaults = {
			vimgrep_arguments = vimgrep_arguments,
		},

		find_files = {
			find_command = {
				'rg',
				'--files',
				'--hidden',
				'--glob',
				'!.git/*',
			},
		},
	},

	extensions = {
		-- https://github.com/nvim-telescope/telescope-ui-select.nvim
		['ui-select'] = {
			require('telescope.themes').get_cursor(),
		},

		-- https://github.com/nvim-telescope/telescope-file-browser.nvim
		file_browser = {
			-- theme = 'dropdown',
			-- hijack_netrw = true,
			hidden = true,
		},
	},
})

require('telescope').load_extension('ui-select')
require('telescope').load_extension('file_browser')
