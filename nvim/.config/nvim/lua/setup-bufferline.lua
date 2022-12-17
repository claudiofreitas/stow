-- https://github.com/akinsho/bufferline.nvim/blob/main/doc/bufferline.txt

require('bufferline').setup({
	options = {
		mode = 'buffers',

		numbers = 'none',

		middle_mouse_command = nil,
		right_mouse_command = nil,

		indicator = {
			style = 'none',
		},

		-- diagnostics = 'nvim_lsp',

		-- Icons
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_buffer_default_icon = true,
		modified_icon = ' ',

		show_duplicate_prefix = true,

		offsets = {
			{
				filetype = 'NvimTree',
				text = nil,
				text_align = 'left',
				separator = false,
			},
		},

		separator_style = { '', '' },
	},

	-- Highlights: https://github.com/akinsho/bufferline.nvim/blob/main/doc/bufferline.txt#L742
	highlights = {
		-- Active buffer ----------------------------------------------------------

		buffer_selected = {
			fg = '#ffa500',
			italic = false,
			bold = true,
		},

		close_button_selected = {
			fg = '#ffa500',
			bold = true,
			-- underline = true,
			-- sp = '#ffa500',
		},

		-- Inactive buffers (when you have more than one buffer open) -------------

		background = {
			fg = '#757575',
		},

		close_button = {
			fg = '#757575',
		},

		-- Background buffer (for example with the Telescope open) ----------------

		buffer_visible = {
			fg = '#474747',
		},

		close_button_visible = {
			fg = '#474747',
		},
	},
})
