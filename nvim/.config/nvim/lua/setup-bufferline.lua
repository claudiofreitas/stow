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

	highlights = {
		-- When it is in the background, for example with the Telescope open.
		buffer_visible = {
			fg = '#474747',
		},

		-- The active buffer.
		buffer_selected = {
			fg = '#ffa500',
			italic = false,
			bold = false,
			underline = true,
			sp = '#ffa500',
		},

		-- All the inactive buffers, when you have more than one buffer open.
		background = {
			fg = '#757575',
		},

		-- Close button area of the active buffer.
		close_button_selected = {
			underline = true,
			sp = '#ffa500',
		},

		-- Close button area of the background buffer (e.g. when Telescope is open).
		close_button_visible = {
			fg = '#474747',
		},

		-- Close button area of the inactive buffer.
		close_button = {
			fg = '#757575',
		},
	},
})
