-- https://github.com/akinsho/bufferline.nvim/blob/main/doc/bufferline.txt

-- Right now bufferline is not updated with correct types to use inside the setup function.
-- Maybe the types are for internal use, and when used with neodev it produces too much warnings.
-- Remove after https://github.com/akinsho/bufferline.nvim/pull/812 is merged.
---@diagnostic disable: missing-fields

local ok, bufferline = pcall(require, 'bufferline')
if not ok then
	print('error on trying to load bufferline')
	return nil
end

bufferline.setup({
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
		modified_icon = ' ',
		-- close_icon = '󰅖',
		-- buffer_close_icon = 'x',

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

	-- https://github.com/akinsho/bufferline.nvim/blob/main/doc/bufferline.txt#L742
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

		modified_visible = {
			fg = '#474747',
		},

		-- Modified icon (floppy disk) --------------------------------------------

		modified = {
			fg = '#f07178',
		},

		modified_selected = {
			fg = '#f07178',
		},
	},
})
