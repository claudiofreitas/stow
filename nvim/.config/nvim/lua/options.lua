local opt = vim.opt

-- Show line numbers
vim.wo.number = true

-- Relative line numbers
vim.wo.relativenumber = false

-- Default: 'internal,filler,closeoff'
opt.diffopt = 'internal,filler,closeoff,vertical,context:99999'

-- Default: 'auto'
opt.signcolumn = 'yes'

opt.fillchars = {
  stl = ' ',
  stlnc = ' ',
  vert = '│',
  fold = '-',
  foldopen = '',
  foldclose = '',
  foldsep = '│',
  diff = ' ',
  msgsep = ' ',
  eob = ' ',
}

opt.foldenable = false

-- listchars
vim.opt.listchars = {
  tab = ' ',
  -- tab = '⟶ ',
  space = '⋅',
  eol = '↙',
}

-- Keep everything in the same line
vim.wo.wrap = false

-- Enable highlighting of the current line
vim.wo.cursorline = true

-- Keep multiple buffers open...?
opt.hidden = true

-- Enables 24-bit RGB color in the TUI. Uses "gui" :highlight attributes instead of "cterm" attributes.
opt.termguicolors = true

-- Encoding
opt.encoding = 'utf-8'
vim.bo.fileencoding = 'utf-8'

-- Display the x,y position of the cursor in the statusline
opt.ruler = false

-- The height of the cmd status line
opt.cmdheight = 1

-- Makes dash-separated words as a word text object
vim.bo.iskeyword = vim.bo.iskeyword .. ',-'

-- Enables mouse...?
opt.mouse = 'a'

-- Horizontal splits will automatically be below
opt.splitbelow = true

-- Vertical splits will automatically be right
opt.splitright = true

-- Amount of lines away from the end of the buffer and the cursor
opt.scrolloff = 8

-- 2 = Always show tabs, 0 = never, 1 = only when there are at least 2 tabs
opt.showtabline = 2

-- 3 = Global status line
opt.laststatus = 3

-- Default: ""
-- opt.tabline = "%-0F"
opt.tabline = "%-0F"

-- Faster completion (default: 4000ms)
opt.updatetime = 150

-- Time in miliseconds to wait for a mapped sequence to complete (Default: 1000)
opt.timeoutlen = 300

-- set formatoptions-=cro                  " Stop newline continution of comments

-- Copy paste between vim and everything else
opt.clipboard = 'unnamedplus'

-- Displays a preview when you use the substitute function (%s/from/to...)
opt.inccommand = 'split'

-- Comma-separated values for which columns to color
vim.wo.colorcolumn = ''

-- Number of <Space> characters that are inserted when you press <Tab> in INSERT mode (default: 0)
opt.softtabstop = 2

-- Display <Tab> characters as 2 <Space> through the files.  (default: 8)
opt.tabstop = 2

-- Makes tabbing smarter will realize you have 2 vs 4 (default: true)
opt.smarttab = true

-- Convert TAB characters to SPACEs. (default: false)
opt.expandtab = true

-- Makes indenting smart (default: false)
opt.smartindent = true

-- Good auto indent? (default: true)
opt.autoindent = true

-- When INDENTing with >, make it indent with 2 spaces. (default: 8)
opt.shiftwidth = 2

-- It will treat searches as case insensitive, unless there is a upper case letter in the pattern. (default: false)
opt.smartcase = true

-- Default: 'full
opt.wildmode = 'list:longest,full'

-- Default: true
opt.wildmenu = true

-- Default: false
opt.ignorecase = true

--set completeopt=menuone,noinsert,noselect
opt.completeopt = 'menuone,noinsert,noselect'
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}

-- Remove the "Match x of y" at the end of the insert list (ctrl+n) 
opt.shortmess = opt.shortmess:append("c")

-- Enables 24-bit RGB color in the TUI. Uses "gui" :highlight attributes instead of "cterm" attributes. 
opt.termguicolors = true


vim.g.mapleader = ' '

-- From previous vimrc:
-- set formatoptions-=cro                  " Stop newline continution of comments
-- set formatoptions-=ro                   " Disable keeping next line as comment after inserting breaking line when in a comment line.
-- call plug#begin(stdpath('data').'/plugged') " Which on Mac is: ~/.local/share/nvim/plugged
--   Plug 'mbbill/undotree' " Use :UndotreeShow to show the Undotree
--   Plug 'janko/vim-test'
--   Plug 'dikiaap/minimalist'
--   Plug 'sheerun/vim-polyglot'
--   Plug 'preservim/nerdcommenter'
--   Plug 'junegunn/goyo.vim'
--   Plug 'prettier/vim-prettier'
--   Plug 'chuling/equinusocio-material.vim'
--   Plug 'mhinz/vim-signify'
-- call plug#end()
--
