-- https://github.com/j-hui/fidget.nvim/blob/main/doc/fidget.md#options
local ok, fidget = pcall(require, 'fidget')
if not ok then
	print('error on trying to load fidget')
	return nil
end

fidget.setup({
	text = {
		spinner = 'dots', -- animation shown when tasks are ongoing
		done = '  ', -- character shown when all tasks are complete
		commenced = 'Started', -- message shown when task starts
		completed = 'Completed', -- message shown when task completes
	},
	align = {
		bottom = true, -- align fidgets along bottom edge of buffer
		right = true, -- align fidgets along right edge of buffer
	},
	timer = {
		spinner_rate = 30, -- frame rate of spinner animation, in ms
		fidget_decay = 250, -- how long to keep around empty fidget, in ms
		task_decay = 1250, -- how long to keep around completed task, in ms
	},
	window = {
		relative = 'win', -- where to anchor, either "win" or "editor"
		blend = 10, -- &winblend for the window
		zindex = nil, -- the zindex value for the window
	},
	fmt = {
		leftpad = true, -- right-justify text in fidget box
		stack_upwards = true, -- list of tasks grows upwards
		max_width = 0, -- maximum width of the fidget box
		-- function to format fidget title
		fidget = function(fidget_name, spinner)
			return string.format('%s %s', spinner, fidget_name)
		end,
		-- function to format each task line
		task = function(task_name, message, percentage)
			return string.format(
				'%s%s [%s]',
				message,
				percentage and string.format(' (%s%%)', percentage) or '',
				task_name
			)
		end,
	},
	-- sources = {                 -- Sources to configure
	--   * = {                     -- Name of source
	--     ignore = false,         -- Ignore notifications from this source
	--   },
	-- },
	debug = {
		logging = false, -- whether to enable logging, for debugging
		strict = false, -- whether to interpret LSP strictly
	},
})

vim.api.nvim_command('highlight link FidgetTitle DiagnosticFloatingHint')
vim.api.nvim_command('highlight link FidgetTask DiagnosticFloatingHint')
