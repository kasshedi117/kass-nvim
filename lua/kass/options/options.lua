vim.opt.guicursor = ""

vim.opt.relativenumber = true -- show relative line numbers
vim.opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
vim.opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
vim.opt.shiftwidth = 4 -- 4 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one
vim.opt.softtabstop = 4
vim.opt.smartindent = true

vim.opt.showmode = false -- don't show mode

vim.opt.wrap = false -- disable line wrapping

vim.opt.swapfile = false -- turn off swapfile
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- appearance
vim.opt.termguicolors = true
vim.opt.background = "dark" -- colorschemes that can be light or dark will be made dark

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes" -- show sign column so that text doesn't shift
vim.opt.isfname:append("@-@")

-- cursor line
vim.opt.cursorline = true -- highlight the current cursor line

-- backspace
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
-- vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

vim.opt.updatetime = 50

vim.opt.iskeyword:append("_")
vim.opt.iskeyword:append("-")

vim.cmd([[autocmd BufEnter * set formatoptions-=o]])
