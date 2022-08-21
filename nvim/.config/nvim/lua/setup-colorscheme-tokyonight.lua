-- https://github.com/folke/tokyonight.nvim
-- vim.g.tokyonight_style = 'night'
vim.api.nvim_command('colorscheme tokyonight')
vim.api.nvim_set_hl(0, 'Normal', { bg = 'None' })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'None' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'None' })
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#555555', ctermbg = 0 })
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#5eacd3' })
vim.api.nvim_set_hl(0, 'netrwDir', { fg = '#5eacd3' })
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#c3e88d', bg = 'None' })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#f07178', bg = 'None' })

