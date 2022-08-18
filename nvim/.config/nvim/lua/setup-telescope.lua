
-- Telescope
require("telescope").setup({
  defaults = {
    prompt_prefix = "🔎 ",
    winblend = 0,
    layout_config = {
      prompt_position = "bottom",
    },
    color_devicons = true,
  },

  -- https://github.com/nvim-telescope/telescope-ui-select.nvim
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_cursor()
    },
  },
})

require("telescope").load_extension("ui-select")

