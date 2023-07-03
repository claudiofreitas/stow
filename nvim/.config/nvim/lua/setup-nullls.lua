-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/MAIN.md
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md

local ok, null_ls = pcall(require, 'null-ls')
if not ok then
	print('error on trying to load null-ls')
	return nil
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
-- local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.prettier,
		formatting.rustfmt,

		-- diagnostics.eslint_d,
	},
	debug = true,
})
