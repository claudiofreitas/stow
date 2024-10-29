-- local opt = vim.opt

-- Show line numbers
vim.wo.number = true

-- Relative line numbers
vim.wo.relativenumber = false

-- Default: 'internal,filler,closeoff'
vim.opt.diffopt = 'internal,filler,closeoff,vertical,context:99999'

-- Default: 'auto'
vim.opt.signcolumn = 'yes'

vim.opt.fillchars = {
	stl = ' ',
	stlnc = ' ',
	vert = '│',
	fold = '-',
	foldopen = '', -- '',
	foldclose = '', -- '',
	foldsep = '│',
	diff = ' ',
	msgsep = ' ',
	eob = ' ',
}

-- Fold
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.foldcolumn = '1'

-- listchars
vim.opt.listchars = {
	tab = ' ',
	-- tab = '⟶ ',
	space = '⋅',
	eol = '↙',
}
vim.opt.list = false

-- Keep everything in the same line
vim.wo.wrap = false

-- Enable highlighting of the current line
vim.wo.cursorline = true

-- Keep multiple buffers open...?
vim.opt.hidden = true

-- Enables 24-bit RGB color in the TUI. Uses "gui" :highlight attributes instead of "cterm" attributes.
vim.opt.termguicolors = true

-- Encoding
vim.opt.encoding = 'utf-8'
vim.bo.fileencoding = 'utf-8'

-- Display the x,y position of the cursor in the statusline
vim.opt.ruler = false

-- The height of the cmd status line
vim.opt.cmdheight = 1

-- Makes dash-separated words as a word text object
vim.bo.iskeyword = vim.bo.iskeyword .. ',-'

-- Enables mouse...?
vim.opt.mouse = 'a'

-- Horizontal splits will automatically be below
vim.opt.splitbelow = true

-- Vertical splits will automatically be right
vim.opt.splitright = true

-- Amount of lines away from the end of the buffer and the cursor
vim.opt.scrolloff = 8

-- 2 = Always show tabs, 0 = never, 1 = only when there are at least 2 tabs
vim.opt.showtabline = 2

-- 3 = Global status line
vim.opt.laststatus = 3

-- Default: ""
-- opt.tabline = "%-0F"
vim.opt.tabline = '%-0F'

-- Faster completion (default: 4000ms)
vim.opt.updatetime = 150

-- Time in miliseconds to wait for a mapped sequence to complete (Default: 1000)
vim.opt.timeoutlen = 300

-- default: 'jcroql' -- help: fo-table
-- opt.formatoptions = ''

-- opt.formatoptions = opt.formatoptions .. 'c'
vim.opt.formatoptions = vim.opt.formatoptions:remove('c')
-- ↑ Auto-wrap comments using 'textwidth',
-- inserting the current comment leader automatically.

vim.opt.formatoptions = vim.opt.formatoptions:remove('r')
-- ↑ Automatically insert the current comment leader
-- after hitting <Enter> in Insert mode.

vim.opt.formatoptions = vim.opt.formatoptions:remove('o')
-- ↑ Automatically insert the current comment leader
-- after hitting 'o' or 'O' in Normal mode. In case comment is unwanted
-- in a specific place use CTRL-U to quickly delete it.

vim.opt.formatoptions = vim.opt.formatoptions:append('j')
-- ↑ Where it makes sense, remove a comment leader when joining lines.  For
-- example, joining:
-- 	int i;   // the index
-- 	         // in the list
-- Becomes:
-- 	int i;   // the index in the list

vim.opt.formatoptions = vim.opt.formatoptions:append('q')
-- ↑ Allow formatting of comments with "gq".
-- Note that formatting will not change blank lines or lines containing
-- only the comment leader.  A new paragraph starts after such a line,
-- or when the comment leader changes.

vim.opt.formatoptions = vim.opt.formatoptions:append('l')
-- ↑ Long lines are not broken in insert mode: When a line was longer than
-- 'textwidth' when the insert command started, Vim does not
-- automatically format it.

-- Copy paste between vim and everything else
vim.opt.clipboard = 'unnamedplus'

-- Displays a preview when you use the substitute function (%s/from/to...)
vim.opt.inccommand = 'split'

-- Comma-separated values for which columns to color
vim.wo.colorcolumn = ''

-- Number of <Space> characters that are inserted when you press <Tab> in INSERT mode (default: 0)
vim.opt.softtabstop = 2

-- Display <Tab> characters as 2 <Space> through the files.  (default: 8)
vim.opt.tabstop = 2

-- Makes tabbing smarter will realize you have 2 vs 4 (default: true)
vim.opt.smarttab = true

-- Convert TAB characters to SPACEs. (default: false)
vim.opt.expandtab = true

-- Makes indenting smart (default: false)
vim.opt.smartindent = true

-- Good auto indent? (default: true)
vim.opt.autoindent = true

-- When INDENTing with >, make it indent with 2 spaces. (default: 8)
vim.opt.shiftwidth = 2

-- It will treat searches as case insensitive, unless there is a upper case letter in the pattern. (default: false)
vim.opt.smartcase = true

-- Default: 'full
vim.opt.wildmode = 'list:longest,full'

-- Default: true
vim.opt.wildmenu = true

-- Default: false
vim.opt.ignorecase = true

--set completeopt=menuone,noinsert,noselect
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }

-- Remove the "Match x of y" at the end of the insert list (ctrl+n)
vim.opt.shortmess:append('c')

-- Remove buffer written messages
vim.opt.shortmess:append('W')

-- Do not give the file info when editing a file, like :silent was used for the command
vim.opt.shortmess:append('F')

vim.opt.foldcolumn = '1'

-- Enables 24-bit RGB color in the TUI. Uses "gui" :highlight attributes instead of "cterm" attributes.
vim.opt.termguicolors = true

vim.g.mapleader = ' '

-- Persist undo history on disk
vim.opt.undodir = os.getenv('HOME') .. '/.local/state/nvim/undo'
vim.opt.undofile = true
