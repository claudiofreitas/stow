vim.api.nvim_command([[syn clear gitcommitSummary]])
vim.api.nvim_command(
	[[syn match   gitcommitSummary    "^.*\%<80v." contained containedin=gitcommitFirstLine nextgroup=gitcommitOverflow contains=@Spell]]
)
vim.api.nvim_command([[highlight def link gitcommitOverflow Error]])
