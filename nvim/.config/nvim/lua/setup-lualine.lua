-- https://github.com/nvim-lualine/lualine.nvim
require('lualine').setup({
  options = {
    theme = 'material',
  },

  -- https://github.com/nvim-lualine/lualine.nvim#general-component-options
  -- sections = {
    -- lualine_a = {
    --   { 'mode', separator = { left = '' }, right_padding = 2 },
    -- },
    -- lualine_b = {
    --   {
    --     'branch',
    --     icon = { '' },
    --   },
    -- },
  -- },

  -- winbar = {
  --   lualine_a = {'filename'},
  -- },
})
