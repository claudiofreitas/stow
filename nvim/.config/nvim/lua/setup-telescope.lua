
-- Telescope
require('telescope').setup({
  defaults = {
    prompt_prefix = '🔎 ',
    winblend = 0,
    sorting_strategy = 'ascending',
    layout_config = {
      anchor = 'CENTER',
      prompt_position = 'top',
    },
    color_devicons = true,
  },

  extensions = {
    -- https://github.com/nvim-telescope/telescope-ui-select.nvim
    ['ui-select'] = {
      require('telescope.themes').get_cursor()
    },

    -- https://github.com/nvim-telescope/telescope-file-browser.nvim
    file_browser = {
      -- theme = 'dropdown',
      -- hijack_netrw = true,
    }
  },
})

require('telescope').load_extension('ui-select')
require('telescope').load_extension('file_browser')

