local lspconfig = require('lspconfig')

-- My experiments
local function nnoremap(lhs, rhs, options)
  vim.keymap.set('n', lhs, rhs, options)
end
local vim_lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_updated_capabilities = require('cmp_nvim_lsp').update_capabilities(vim_lsp_capabilities)

local function custom_config(_config)
  return vim.tbl_deep_extend(
    "force",
    {
      capabilities = cmp_updated_capabilities,
      on_attach = function(client, bufnr) --> signature: function(client, bufnr)
        local current_buffer_option = { buffer = bufnr }
        nnoremap('<leader>vd', function() vim.diagnostic.open_float() end, current_buffer_option) -- "view diagnostics"
        nnoremap('<leader><cr>', function() vim.lsp.buf.code_action() end, current_buffer_option)
        nnoremap('K', vim.lsp.buf.hover, current_buffer_option)
        nnoremap('<C-K>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', current_buffer_option)
        nnoremap('gd', vim.lsp.buf.definition, current_buffer_option) -- "go definition"
        nnoremap('gi', vim.lsp.buf.implementation, current_buffer_option) -- "go implementation"
        -- nnoremap('gr', vim.lsp.buf.references, current_buffer_option) -- "go references"
        nnoremap('gr', '<cmd>Telescope lsp_references<cr>', current_buffer_option) -- "go references"
        nnoremap('<leader>re', vim.lsp.buf.rename, current_buffer_option)
        nnoremap('<leader>f', vim.lsp.buf.format, current_buffer_option)

        if client.server_capabilities.document_highlight then
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
      end,
    },
    _config or {}
  )
end



-- Lua (sumneko)
local sumneko_binary_path = '/Users/claudio/repos/lua-language-server/bin/macOS/lua-language-server'
local sumneko_root_path = '/Users/claudio/repos/lua-language-server/main.lua'

lspconfig.sumneko_lua.setup(custom_config({
  cmd = { sumneko_binary_path, "-E", sumneko_root_path },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";"), -- runtime_path,
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        }, --vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    }
  },
}))

-- Rust
lspconfig.rust_analyzer.setup(custom_config({}))

-- Typescript
lspconfig.tsserver.setup(custom_config({
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx"
  },
}))

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
        }
      }
    }
  },
}))

print("loaded setup-lspconfig.lua")

