-- https://github.com/nvimdev/lspsaga.nvim

local ok, lspsaga = pcall(require, 'lspsaga')
if not ok then
	print('error on trying to load lspsaga')
	return nil
end

lspsaga.setup({

	ui = {
		-- This option only works in Neovim 0.9
		title = true,
		-- Border type can be single, double, rounded, solid, shadow.
		border = 'single',
		winblend = 0,
		expand = '',
		collapse = '',
		code_action = '💡',
		incoming = ' ',
		outgoing = ' ',
		hover = ' ',
		kind = {},
	},

	symbol_in_winbar = {
		enable = true,
		separator = '  ',
		ignore_patterns = {},
		hide_keyword = false,
		show_file = true,
		folder_level = 1,
		respect_root = false,
		color_mode = true,
	},
})
