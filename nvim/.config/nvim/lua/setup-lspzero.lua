-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/lsp.md
-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md

local ok, lspzero = pcall(require, 'lsp-zero')
if not ok then
	print('error on trying to load lsp-zero')
	return nil
end

lspzero.preset({
	name = 'minimal',
})

-- My experiments -- TODO: move this to a separate module utils
local function nnoremap(lhs, rhs, options)
	vim.keymap.set('n', lhs, rhs, options)
end

lspzero.on_attach(function(lsp_client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	-- Keymaps
	nnoremap('<leader>vd', function()
		vim.diagnostic.open_float()
	end, opts) -- "view diagnostics"
	nnoremap(']d', function()
		vim.diagnostic.goto_next()
	end)
	nnoremap('[d', function()
		vim.diagnostic.goto_prev()
	end)
	nnoremap('<leader><cr>', function()
		vim.lsp.buf.code_action()
	end, opts)
	nnoremap('K', vim.lsp.buf.hover, opts)
	nnoremap('<C-K>', vim.lsp.buf.signature_help, opts)
	nnoremap('gd', vim.lsp.buf.definition, opts) -- "go definition"
	nnoremap('gi', vim.lsp.buf.implementation, opts) -- "go implementation"
	-- nnoremap('gr', vim.lsp.buf.references, opts) -- "go references"
	nnoremap('gr', '<cmd>Telescope lsp_references<cr>', opts) -- "go references"
	nnoremap('<leader>re', vim.lsp.buf.rename, opts)
	nnoremap('<leader>f', function()
		vim.lsp.buf.format({ timeout_ms = 2000 })
	end, opts)

	-- Highlights
	if lsp_client.server_capabilities.documentHighlightProvider then
		local lsp_highlight_group = vim.api.nvim_create_augroup('ClaudioHighlightOnCursorHold', { clear = true })

		vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
			callback = vim.lsp.buf.document_highlight,
			group = lsp_highlight_group,
		})

		vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
			callback = vim.lsp.buf.clear_references,
			group = lsp_highlight_group,
		})
	end
end)

lspzero.ensure_installed({
	'lua_ls',
	'rust_analyzer',
	'tsserver',
	'cssls',
	'cssmodules_ls',
	'jsonls',
	'terraformls',
	'html',
	'tailwindcss',
	'astro',
})

local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup(lspzero.nvim_lua_ls({
	settings = {
		telemetry = { enable = false },
	},
}))
lspconfig.tsserver.setup({
	filetypes = {
		'javascript',
		'javascriptreact',
		'javascript.jsx',
		'typescript',
		'typescriptreact',
		'typescript.tsx',
	},
})
lspconfig.html.setup({
	capabilities = {
		textDocument = {
			completion = {
				completionItem = {
					snippetSupport = true,
				},
			},
		},
	},
})

lspzero.setup()