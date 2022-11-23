-- https://github.com/catppuccin/nvim
vim.g.catppuccin_flavour = 'macchiato' -- from light to darkest: latte, frappe, macchiato, mocha
require('catppuccin').setup({
	transparent_background = true,
})
vim.api.nvim_command('colorscheme catppuccin')

