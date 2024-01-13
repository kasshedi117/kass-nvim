local opt = vim.opt -- for conciseness

vim.opt.guicursor = ""

vim.opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.softtabstop = 4
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

vim.opt.smartindent = true

-- line wrapping
opt.wrap = false -- disable line wrapping

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- appearance
-- opt.termguicolors = true
-- opt.background = "dark" -- colorschemes that can be light or dark will be made dark

opt.scrolloff = 8
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.isfname:append("@-@")

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

vim.opt.iskeyword:append("_")
vim.opt.iskeyword:append("-")

vim.cmd([[autocmd BufEnter * set formatoptions-=o]])
