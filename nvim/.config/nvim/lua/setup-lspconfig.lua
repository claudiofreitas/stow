local lspconfig = require('lspconfig')

-- My experiments
local function nnoremap(lhs, rhs, options)
	vim.keymap.set('n', lhs, rhs, options)
end
local vim_lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_default_capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.tbl_deep_extend('force', vim_lsp_capabilities, cmp_default_capabilities)

-- keymap configuration
local function configure_keymaps(buffer_number)
	local current_buffer_option = { buffer = buffer_number }

	nnoremap('<leader>vd', function()
		vim.diagnostic.open_float()
	end, current_buffer_option) -- "view diagnostics"

	nnoremap('<leader><cr>', function()
		vim.lsp.buf.code_action()
	end, current_buffer_option)

	nnoremap('K', vim.lsp.buf.hover, current_buffer_option)
	nnoremap('<C-K>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', current_buffer_option)
	nnoremap('gd', vim.lsp.buf.definition, current_buffer_option) -- "go definition"
	nnoremap('gi', vim.lsp.buf.implementation, current_buffer_option) -- "go implementation"
	-- nnoremap('gr', vim.lsp.buf.references, current_buffer_option) -- "go references"
	nnoremap('gr', '<cmd>Telescope lsp_references<cr>', current_buffer_option) -- "go references"
	nnoremap('<leader>re', vim.lsp.buf.rename, current_buffer_option)
	nnoremap('<leader>f', function()
		vim.lsp.buf.format({ timeout_ms = 2000 })
	end, current_buffer_option)
	nnoremap(']d', function()
		vim.diagnostic.goto_next()
	end)
	nnoremap('[d', function()
		vim.diagnostic.goto_prev()
	end)
end

-- custom default configuration
local function custom_config(_config)
	local custom_on_attach = function(lsp_client, buffer_number) --> signature: function(client, bufnr)
		if lsp_client.name == 'tsserver' then
			lsp_client.server_capabilities.documentFormattingProvider = false
		end

		configure_keymaps(buffer_number)

		if lsp_client.server_capabilities.document_highlight then
			local lspHighlightGroup = vim.api.nvim_create_augroup('LspHighlightOnCursorHold', { clear = true })
			vim.api.nvim_create_autocmd('CursorMoved', {
				callback = vim.lsp.buf.document_highlight,
				group = lspHighlightGroup,
			})
			vim.api.nvim_create_autocmd('CursorMoved', {
				callback = vim.lsp.buf.clear_references,
				group = lspHighlightGroup,
			})
		end
	end

	local extended_configuration = vim.tbl_deep_extend('force', {
		capabilities = cmp_default_capabilities,
		on_attach = custom_on_attach,
	}, _config or {})

	return extended_configuration
end

-- Lua (sumneko)
local sumneko_binary_path = '/Users/claudio/repos/lua-language-server/bin/macOS/lua-language-server'
local sumneko_root_path = '/Users/claudio/repos/lua-language-server/main.lua'

lspconfig.sumneko_lua.setup(custom_config({
	cmd = { sumneko_binary_path, '-E', sumneko_root_path },
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = vim.split(package.path, ';'), -- runtime_path,
			},
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				}, --vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
}))

-- Rust
lspconfig.rust_analyzer.setup(custom_config({}))

-- Typescript
lspconfig.tsserver.setup(custom_config({
	filetypes = {
		'javascript',
		'javascriptreact',
		'javascript.jsx',
		'typescript',
		'typescriptreact',
		'typescript.tsx',
	},
}))

-- css
lspconfig.cssls.setup(custom_config({}))

-- css modules
lspconfig.cssmodules_ls.setup(custom_config({}))

-- JSON (jsonls)
lspconfig.jsonls.setup(custom_config({}))

-- Terraform
lspconfig.terraformls.setup(custom_config({}))

-- HTML
lspconfig.html.setup(custom_config({
	capabilities = {
		textDocument = {
			completion = {
				completionItem = {
					snippetSupport = true,
				},
			},
		},
	},
}))

-- Tailwind CSS
lspconfig.tailwindcss.setup(custom_config({}))

-- Astro
lspconfig.astro.setup(custom_config({}))

print('loaded setup-lspconfig.lua')
