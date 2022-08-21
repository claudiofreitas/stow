-- https://github.com/nvim-lualine/lualine.nvim
require('lualine').setup({
  options = {
    theme = 'auto',
  },

  -- https://github.com/nvim-lualine/lualine.nvim#general-component-options
  sections = {
    -- lualine_a = {
    --   { 'mode', separator = { left = '' }, right_padding = 2 },
    -- },
    -- lualine_b = {
    --   {
    --     'branch',
    --     icon = { '' },
    --   },
    -- },
    lualine_c = {
      {'filename'},
      {
        function()
          local msg = 'No Active LSP'
          local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = ' LSP:',
        color = {
          fg = '#ffffff',
          gui = 'bold',
        },
      },
    },
  },

  -- winbar = {
  --   lualine_a = {'filename'},
  -- },
})
