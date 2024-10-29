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

table.insert(vimgrep_arguments, '--glob')
table.insert(vimgrep_arguments, '!web/src/store/api/gen/*')

-- Telescope
local actions = require('telescope.actions')
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
		vimgrep_arguments = {
			-- Defaults:
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case',
			-- Custom:
			'--hidden',
			'--glob',
			'!.git/*',
			'--glob',
			'!**/src/store/api/gen/*',
		},
	},

	pickers = {
		defaults = {
			vimgrep_arguments = {
				-- Defaults:
				'rg',
				'--color=never',
				'--no-heading',
				'--with-filename',
				'--line-number',
				'--column',
				'--smart-case',
				-- Custom:
				'--hidden',
				'--glob',
				'!.git/*',
				'--glob',
				'!**/src/store/api/gen/*',
			},
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

		buffers = {
			mappings = {
				i = {
					['<C-x>'] = actions.delete_buffer + actions.move_to_top,
				},
			},
		},

		lsp_references = {
			show_line = false,
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
