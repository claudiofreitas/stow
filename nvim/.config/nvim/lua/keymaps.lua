-- General
-- vim.api.nvim_set_keymap('i', '<Tab>',   '"\\<C-n>"', {expr = true})
-- vim.api.nvim_set_keymap('i', '<S-Tab>', '"\\<C-p>"', {expr = true})
vim.api.nvim_set_keymap('n', '<F1>', ':lua vim.lsp.buf.signature_help() <CR>', {})

-- vim.api.nvim_set_keymap('n', '<S-PageUp>', '5zh', {})
-- vim.api.nvim_set_keymap('n', '<S-PageDown>', '5zl', {})

vim.api.nvim_set_keymap('', '<S-ScrollWheelUp>', '<ScrollWheelLeft>', {})
vim.api.nvim_set_keymap('', '<S-ScrollWheelDown>', '<ScrollWheelRight>', {})

vim.api.nvim_set_keymap('n', '<M-Left>', ':bp<CR>', {})
vim.api.nvim_set_keymap('n', '<M-Right>', ':bn<CR>', {})

-- Disable relative line number
vim.api.nvim_set_keymap('n', '<Leader>0', ':set norelativenumber<CR>', {})

-- Display invisible characters
vim.api.nvim_set_keymap('n', '<Leader>+', ':set list!<CR>', { desc = 'Toggle invisible characters' })

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
vim.api.nvim_set_keymap('n', '<leader>rg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", {})

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

-- In Quickfix list, `dd` will remove current item from list
-- " When using `dd` in the quickfix list, remove the item from the quickfix list.
-- function! RemoveQFItem()
--   let curqfidx = line('.') - 1
--   let qfall = getqflist()
--   call remove(qfall, curqfidx)
--   call setqflist(qfall, 'r')
--   execute curqfidx + 1 . "cfirst"
--   :copen
-- endfunction
-- :command! RemoveQFItem :call RemoveQFItem()
-- " Use map <buffer> to only map dd in the quickfix window. Requires +localmap
-- autocmd FileType qf map <buffer> dd :RemoveQFItem<cr>

-- TODO: After this is tested to work, re-write with variable names that I understand
-- Function to remove the current item from the quickfix list
local function remove_qf_item()
	-- Get the current line number in the quickfix list (1-based index)
	local quickfixHighlightedLineIndex = vim.fn.line('.')
	-- print('curqfidx: ' .. curqfidx) -- Debug print

	-- Get the entire quickfix list
	local qfall = vim.fn.getqflist()

	-- Remove the item at the current index
	table.remove(qfall, quickfixHighlightedLineIndex)

	-- Set the modified quickfix list
	vim.fn.setqflist(qfall, 'r')

	-- Move to the next item in the quickfix list
	-- vim.cmd((quickfixHighlightedLineIndex + 1) .. 'cfirst')

	-- Open the quickfix window
	vim.cmd('copen')
end

-- Create a command that calls the remove_qf_item function
vim.api.nvim_create_user_command('RemoveQFItem', remove_qf_item, {})

-- Set up an autocommand to map 'dd' to the RemoveQFItem command in the quickfix window
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'qf',
	callback = function()
		vim.api.nvim_buf_set_keymap(0, 'n', 'dd', ':RemoveQFItem<CR>', { noremap = true, silent = true })
	end,
})

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
