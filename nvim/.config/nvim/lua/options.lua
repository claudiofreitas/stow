local opt = vim.opt

-- Show line numbers
vim.wo.number = true

-- Default: 'internal,filler,closeoff'
vim.opt.diffopt = 'internal,filler,closeoff,vertical'

-- Default: 'auto'
vim.opt.signcolumn = 'yes'

-- Character to fill end of buffer
vim.opt.fillchars['eob'] = ' '
vim.opt.fillchars['vert'] = '|'

-- Relative line numbers
vim.wo.relativenumber = true

-- Keep everything in the same line
vim.wo.wrap = false

-- Enable highlighting of the current line
vim.wo.cursorline = true

-- Keep multiple buffers open...?
vim.o.hidden = true

-- Enables 24-bit RGB color in the TUI. Uses "gui" :highlight attributes instead of "cterm" attributes.
vim.o.termguicolors = true

-- Encoding
vim.o.encoding = 'utf-8'
vim.bo.fileencoding = 'utf-8'

-- Display the x,y position of the cursor in the statusline
vim.o.ruler = false

-- The height of the cmd status line
vim.o.cmdheight = 1

-- Makes dash-separated words as a word text object
vim.bo.iskeyword = vim.bo.iskeyword .. ',-'

-- Enables mouse...?
vim.o.mouse = 'a'

-- Horizontal splits will automatically be below
vim.o.splitbelow = true

-- Vertical splits will automatically be right
vim.o.splitright = true

-- Amount of lines away from the end of the buffer and the cursor
vim.o.scrolloff = 8

-- 2 = Always show tabs, 0 = never, 1 = only when there are at least 2 tabs
vim.o.showtabline = 2

-- Default: ""
-- vim.o.tabline = "%-0F"
vim.o.tabline = ""

-- Faster completion (default: 4000ms)
vim.o.updatetime = 150

-- Time in miliseconds to wait for a mapped sequence to complete (Default: 1000)
vim.o.timeoutlen = 300

-- set formatoptions-=cro                  " Stop newline continution of comments

-- Copy paste between vim and everything else
vim.o.clipboard = 'unnamedplus'

-- Displays a preview when you use the substitute function (%s/from/to...)
vim.o.inccommand = 'split'

-- Comma-separated values for which columns to color
vim.wo.colorcolumn = ''

-- Number of <Space> characters that are inserted when you press <Tab> in INSERT mode (default: 0)
vim.o.softtabstop = 2

-- Display <Tab> characters as 2 <Space> through the files.  (default: 8)
vim.o.tabstop = 2

-- Makes tabbing smarter will realize you have 2 vs 4 (default: true)
vim.o.smarttab = true

-- Convert TAB characters to SPACEs. (default: false)
vim.o.expandtab = true

-- Makes indenting smart (default: false)
vim.o.smartindent = true

-- Good auto indent? (default: true)
vim.o.autoindent = true

-- When INDENTing with >, make it indent with 2 spaces. (default: 8)
vim.o.shiftwidth = 2

-- It will treat searches as case insensitive, unless there is a upper case letter in the pattern. (default: false)
vim.o.smartcase = true

-- Default: 'full
vim.o.wildmode = 'list:longest,full'

-- Default: true
vim.o.wildmenu = true

-- Default: false
vim.o.ignorecase = true

--set completeopt=menuone,noinsert,noselect
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}

-- Remove the "Match x of y" at the end of the insert list (ctrl+n) 
vim.o.shortmess = vim.o.shortmess .. "c"

-- Enables 24-bit RGB color in the TUI. Uses "gui" :highlight attributes instead of "cterm" attributes. 
vim.o.termguicolors = true


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
