local ok, notify = pcall(require, 'notify')
if not ok then
	print('error on trying to load notify')
	return nil
end

vim.notify = notify

-- https://github.com/rcarriga/nvim-notify/wiki/Usage-Recipes
-- https://github.com/rcarriga/nvim-notify#configuration
notify.setup({
	background_colour = '#000000',

	fps = 30,

	icons = {
		DEBUG = '',
		ERROR = '',
		INFO = '',
		TRACE = '✎',
		WARN = '',
	},

	level = 2,

	minimum_width = 50,

	-- 'default' or 'minimal'
	render = 'minimal',

	-- 'fade_in_slide_out', 'fade', 'slide', 'static'
	stages = 'static',

	timeout = 5000,
})
