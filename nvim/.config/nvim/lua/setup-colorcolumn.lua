vim.wo.colorcolumn = ''
vim.g.claudio_current_color_column = '80'
function ToggleColorColumn()
	vim.g.claudio_current_color_column, vim.wo.colorcolumn = vim.wo.colorcolumn, vim.g.claudio_current_color_column
end
vim.keymap.set('n', '<Leader>\\', ToggleColorColumn)
