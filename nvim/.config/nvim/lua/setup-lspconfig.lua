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
      on_attach = function() --> signature: function(client, bufnr)
        nnoremap('<leader>vd', function() vim.diagnostic.open_float() end, { buffer = 0 }) -- "view diagnostics"
        nnoremap('<leader><cr>', function() vim.lsp.buf.code_action() end, { buffer = 0 })
        nnoremap('K', vim.lsp.buf.hover, { buffer = 0 })
        nnoremap('<C-K>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { buffer = 0 })
        nnoremap('gd', vim.lsp.buf.definition, { buffer = 0 }) -- "go definition"
        nnoremap('gi', vim.lsp.buf.implementation, { buffer = 0 }) -- "go implementation"
        -- nnoremap('gr', vim.lsp.buf.references, { buffer = 0 }) -- "go references"
        nnoremap('gr', '<cmd>Telescope lsp_references<cr>', { buffer = 0 }) -- "go references"
        nnoremap('<leader>re', vim.lsp.buf.rename, { buffer = 0 })
      end,
    },
    _config or {}
  )
end

lspconfig.util.default_config = vim.tbl_extend(
  "force",
  lspconfig.util.default_config,
  {
    log_level = vim.lsp.protocol.MessageType.Error,
  }
)

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

