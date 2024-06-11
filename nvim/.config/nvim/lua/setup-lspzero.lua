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
	nnoremap('gR', function()
		-- testando uma lsp reference list um pouco maior para usar com monitor wide, com o espaco para nome ocupando 80 chars
		require('telescope.builtin').lsp_references({
			fname_width = 80,
		})
	end, opts)
	nnoremap('<leader>re', vim.lsp.buf.rename, opts)
	-- nnoremap('<leader>f', function()
	-- 	vim.lsp.buf.format({ timeout_ms = 2000 })
	-- end, opts)

	-- Highlights
	if lsp_client.server_capabilities.documentHighlightProvider then
		local lsp_highlight_group = vim.api.nvim_create_augroup('ClaudioHighlightOnCursorHold', { clear = true })

		vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
			callback = vim.lsp.buf.document_highlight,
			group = lsp_highlight_group,
			buffer = bufnr,
		})

		vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
			callback = vim.lsp.buf.clear_references,
			group = lsp_highlight_group,
			buffer = bufnr,
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
	'prismals',
	'bashls',
	'biome',
	-- 'volar',
})

local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup(lspzero.nvim_lua_ls({
	settings = {
		Lua = {
			telemetry = { enable = false },
			completion = {
				callSnippet = 'Replace',
			},
		},
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

-- lspconfig.pyright.setup({})
lspconfig.ruff_lsp.setup({
	settings = {
		logLevel = 'info',
		codeAction = {
			fixViolation = {
				enable = true,
			},
		},
	},
})

lspconfig.bashls.setup({
	filetypes = { 'sh', 'zsh' },
})

-- lspconfig.volar.setup({
-- 	filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
-- })

lspzero.setup()

-- Disable tsserver in case volar is connected
-- https://www.reddit.com/r/neovim/comments/117gopv/disable_tsserver_if_using_volar_takeover_mode/
local lsp_conficts, _ = pcall(vim.api.nvim_get_autocmds, { group = 'ClaudioLspAttachConflicts' })
if not lsp_conficts then
	vim.api.nvim_create_augroup('ClaudioLspAttachConflicts', {})
end
vim.api.nvim_create_autocmd('LspAttach', {
	group = 'ClaudioLspAttachConflicts',
	desc = 'prevent tsserver and volar competing',
	callback = function(args)
		if not (args.data and args.data.client_id) then
			return
		end
		local active_clients = vim.lsp.get_active_clients()
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		-- prevent tsserver and volar competing
		-- if client.name == "volar" or require("lspconfig").util.root_pattern("nuxt.config.ts")(vim.fn.getcwd()) then
		-- OR
		if client.name == 'volar' then
			for _, client_ in pairs(active_clients) do
				-- stop tsserver if volar is already active
				if client_.name == 'tsserver' then
					client_.stop()
				end
			end
		elseif client.name == 'tsserver' then
			for _, client_ in pairs(active_clients) do
				-- prevent tsserver from starting if volar is already active
				if client_.name == 'volar' then
					client.stop()
				end
			end
		end
	end,
})
