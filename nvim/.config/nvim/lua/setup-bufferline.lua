require('bufferline').setup({
	options = {
		mode = 'buffers',
		numbers = 'none',
		right_mouse_command = nil,
    indicator = {
      style = 'none',
    },
    modified_icon = ' ',
    offsets = {
      {
        filetype = 'NvimTree',
        text = nil,
        text_align = 'left',
        separator = false,
      }
    },
    separator_style = 'thick',
	},
})
