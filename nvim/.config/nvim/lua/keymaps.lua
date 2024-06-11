-- General
-- vim.api.nvim_set_keymap('i', '<Tab>',   '"\\<C-n>"', {expr = true})
-- vim.api.nvim_set_keymap('i', '<S-Tab>', '"\\<C-p>"', {expr = true})
vim.api.nvim_set_keymap('n', '<F1>', ':lua vim.lsp.buf.signature_help() <CR>', {})
vim.api.nvim_set_keymap('n', '<S-PageUp>', '5zh', {})
vim.api.nvim_set_keymap('n', '<S-PageDown>', '5zl', {})
vim.api.nvim_set_keymap('', '<S-ScrollWheelUp>', '<ScrollWheelLeft>', {})
-- vim.api.nvim_set_keymap('', '<S-ScrollWheelDown>', '<ScrollWheelRight>', {})
-- vim.api.nvim_set_keymap('', '<S-ScrollWheelDown>', function()
-- 	print('scrolled')
-- end, {})

vim.keymap.set('', '<S-ScrollWheelDown>', function()
	print('scrolled')
end, {})

vim.api.nvim_set_keymap('n', '<M-Left>', ':bp<CR>', {})
vim.api.nvim_set_keymap('n', '<M-Right>', ':bn<CR>', {})

-- Disable relative line number
vim.api.nvim_set_keymap('n', '<Leader>0', ':set norelativenumber<CR>', {})

-- Navigate forward or backward the quickfix list with [c ]c
vim.api.nvim_set_keymap('n', '[q', '<cmd>cprev<cr>zz', { desc = 'Quickfix previous' })
vim.api.nvim_set_keymap('n', ']q', '<cmd>cnext<cr>zz', { desc = 'Quickfix next' })

vim.keymap.set('v', '<S-Up>', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '<S-Down>', ":m '>+1<CR>gv=gv")

vim.keymap.set({ 'i', 'n' }, '<Esc>', '<cmd>noh<CR><Esc>', { desc = 'Escape and clear hlsearch' })

-- Telescope
-- vim.api.nvim_set_keymap('n', '<Leader>o', "<cmd>lua require('telescope.builtin').find_files()<cr>", {})
vim.keymap.set('n', '<leader>o', function()
	local telescope = require('telescope.builtin')
	telescope.find_files({
		-- use fd to "find files" and return absolute paths
		find_command = { 'fd', '-t=f', '-a' },
		-- path_display = { 'absolute' },
		wrap_results = true,
	})
end, {})
vim.api.nvim_set_keymap('n', '<Leader>b', ':Telescope buffers <CR>', {})
vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", {})
vim.api.nvim_set_keymap('n', '<leader>h', "<cmd>lua require('telescope.builtin').help_tags()<cr>", {})
vim.api.nvim_set_keymap('n', '<leader>e', "<cmd>lua require('telescope.builtin').oldfiles()<cr>", {})

vim.api.nvim_set_keymap(
	'n',
	'<leader>fb',
	"<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>",
	{}
)

-- When in visual, <leader>p paste the content without replacing the yank register
vim.api.nvim_set_keymap('v', '<leader>p', '"_dP', {})

-- Undotree
vim.api.nvim_set_keymap('n', '<Leader>u', '<cmd>UndotreeToggle<CR>', {})

-- Actually the keymap below is CTRL+/, but I don't know why it should be mapped as _
-- vim.api.nvim_set_keymap("n", "<C-_>", ":Telescope current_buffer_fuzzy_find <CR>", {})

-- Fugitive
vim.api.nvim_set_keymap('n', '<C-g>', ':G <CR>', {})

-- Misc
vim.api.nvim_command('nmap <F9> :TSHighlightCapturesUnderCursor<CR>')
vim.keymap.set('n', '<leader><leader>x', function()
	vim.api.nvim_command('source %')
end)
