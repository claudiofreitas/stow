-- General
-- vim.api.nvim_set_keymap('i', '<Tab>',   '"\\<C-n>"', {expr = true})
-- vim.api.nvim_set_keymap('i', '<S-Tab>', '"\\<C-p>"', {expr = true})
vim.api.nvim_set_keymap("n", "<F1>", ':lua vim.lsp.buf.signature_help() <CR>', {})
vim.api.nvim_set_keymap("n", "<S-PageUp>", '5zh', {})
vim.api.nvim_set_keymap("n", "<S-PageDown>", '5zl', {})



-- Telescope
vim.api.nvim_set_keymap("n", "<Leader>o", "<cmd>lua require('telescope.builtin').find_files()<cr>", {})
vim.api.nvim_set_keymap("n", "<Leader>b", ':Telescope buffers <CR>', {})
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>lua require('telescope.builtin').help_tags()<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>", {})

-- Actually the keymap below is CTRL+/, but I don't know why it should be mapped as _
-- vim.api.nvim_set_keymap("n", "<C-_>", ":Telescope current_buffer_fuzzy_find <CR>", {})



-- Fugitive
vim.api.nvim_set_keymap("n", "<C-g>", ":G <CR>", {})



-- Misc
vim.api.nvim_command('nmap <F7> :TSHighlightCapturesUnderCursor<CR>')

