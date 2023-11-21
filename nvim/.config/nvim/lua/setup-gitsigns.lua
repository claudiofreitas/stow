-- https://github.com/lewis6991/gitsigns.nvim

--[[

https://en.wikipedia.org/wiki/Box-drawing_character

U+250x 	─ 	━ 	│ 	┃ 	┄ 	┅ 	┆ 	┇ 	┈ 	┉ 	┊ 	┋ 	┌ 	┍ 	┎ 	┏
U+251x 	┐ 	┑ 	┒ 	┓ 	└ 	┕ 	┖ 	┗ 	┘ 	┙ 	┚ 	┛ 	├ 	┝ 	┞ 	┟
U+252x 	┠ 	┡ 	┢ 	┣ 	┤ 	┥ 	┦ 	┧ 	┨ 	┩ 	┪ 	┫ 	┬ 	┭ 	┮ 	┯
U+253x 	┰ 	┱ 	┲ 	┳ 	┴ 	┵ 	┶ 	┷ 	┸ 	┹ 	┺ 	┻ 	┼ 	┽ 	┾ 	┿
U+254x 	╀ 	╁ 	╂ 	╃ 	╄ 	╅ 	╆ 	╇ 	╈ 	╉ 	╊ 	╋ 	╌ 	╍ 	╎ 	╏
U+255x 	═ 	║ 	╒ 	╓ 	╔ 	╕ 	╖ 	╗ 	╘ 	╙ 	╚ 	╛ 	╜ 	╝ 	╞ 	╟
U+256x 	╠ 	╡ 	╢ 	╣ 	╤ 	╥ 	╦ 	╧ 	╨ 	╩ 	╪ 	╫ 	╬ 	╭ 	╮ 	╯
U+257x 	╰ 	╱ 	╲ 	╳ 	╴ 	╵ 	╶ 	╷ 	╸ 	╹ 	╺ 	╻ 	╼ 	╽ 	╾ 	╿

U+258x 	▀ 	▁ 	▂ 	▃ 	▄ 	▅ 	▆ 	▇ 	█ 	▉ 	▊ 	▋ 	▌ 	▍ 	▎ 	▏
U+259x 	▐ 	░ 	▒ 	▓ 	▔ 	▕ 	▖ 	▗ 	▘ 	▙ 	▚ 	▛ 	▜ 	▝ 	▞ 	▟

--]]

local ok, gitsigns = pcall(require, 'gitsigns')
if not ok then
	print('error on trying to load gitsigns')
	return nil
end

gitsigns.setup({
	signs = {
		add = { hl = 'GitSignsAdd', text = '┃', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
		change = { hl = 'GitSignsChange', text = '┃', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
		delete = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
		topdelete = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
		changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
		untracked = { hl = 'GitSignsAdd', text = '┃', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
		delay = 200,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = '<summary> (<author>) <author_time:%Y-%m-%d>',
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	preview_config = {
		-- Options passed to nvim_open_win
		border = 'single',
		style = 'minimal',
		relative = 'cursor',
		row = 0,
		col = 1,
	},
	on_attach = function(bufnr)
		-- Navigation
		vim.keymap.set('n', '[c', function()
			if vim.wo.diff then
				return '[c'
			end
			vim.schedule(function()
				gitsigns.prev_hunk()
			end)
			return '<Ignore>'
		end, { expr = true, buffer = bufnr, desc = 'Prev change' })

		vim.keymap.set('n', ']c', function()
			if vim.wo.diff then
				return ']c'
			end
			vim.schedule(function()
				gitsigns.next_hunk()
			end)
			return '<Ignore>'
		end, { expr = true, buffer = bufnr, desc = 'Next change' })

		-- Actions
		vim.keymap.set('n', '<Leader>B', gitsigns.toggle_current_line_blame, { buffer = bufnr, desc = 'hunk blame' })
		-- vim.keymap.set('n', '<Leader>ha', gitsigns.stage_hunk, { buffer = bufnr, desc = 'hunk stage (add)' })
		-- vim.keymap.set('n', '<Leader>hr', gitsigns.reset_hunk, { buffer = bufnr, desc = 'hunk restore/reset' })
		-- vim.keymap.set('n', '<Leader>hu', gitsigns.undo_stage_hunk, { buffer = bufnr, desc = 'hunk undo stage' })
		-- vim.keymap.set('n', '<Leader>hp', gitsigns.preview_hunk, { buffer = bufnr, desc = 'hunk preview diff' })
		-- vim.keymap.set('n', '<Leader>hd', gitsigns.diffthis, { buffer = bufnr, desc = 'hunk diffthis(?)' })
	end,
})
