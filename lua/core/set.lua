vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

vim.opt.backspace = "indent,eol,start"

-- vim.opt.splitright = true;
-- vim.opt.splitbelow = true;

vim.opt.iskeyword:append("_")
vim.opt.iskeyword:append("-")

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.wildignore = "blue.vim,darkblue.vim,default.vim,delek.vim,desert.vim,elflord.vim,evening.vim,habamax.vim,industry.vim,koehler.vim,lunaperche.vim,morning.vim,murphy.vim,pablo.vim,peachpuff.vim,quiet.vim,ron.vim,shine.vim,slate.vim,torte.vim,zellner.vim"
