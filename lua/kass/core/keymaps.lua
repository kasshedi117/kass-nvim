-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap.set -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })
keymap("i", "[[", "<ESC>", { desc = "Exit insert mode with [[" })
keymap("i", "[j", "<ESC>", { desc = "Exit insert mode with [[" })

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

keymap("n", "J", "mzJ`z")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "[]", "<nop>")
keymap("n", "[%", "<nop>")
keymap("n", "[m", "<nop>")
keymap("n", "[d", "<nop>")
keymap("n", "]%", "<nop>")
keymap("n", "]m", "<nop>")
keymap("n", "]I", "<nop>")
keymap("n", "]d", "<nop>")
keymap("n", "(", "<C-u>zz", { nowait = true })
keymap("n", "&", "<C-d>zz", { nowait = true })
keymap("n", "<S-]>", "<C-y>", { nowait = true })
keymap("n", "<S-[>", "<C-e>", { nowait = true })
keymap("n", "{", "f", { nowait = true })
keymap("n", "\\", "F", { nowait = true })
keymap("v", "{", "f", { nowait = true })
keymap("v", "\\", "F", { nowait = true })
keymap("n", "<S-h>", "^", { nowait = true })
keymap("n", "<S-l>", "$", { nowait = true })
keymap("v", "<S-h>", "^", { nowait = true })
keymap("v", "<S-L>", "$h", { nowait = true })
keymap("n", "γ", "<C-y>", { nowait = true })
keymap("n", "δ", "<C-e>", { nowait = true })
keymap("n", "[I", "<nop>")

keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

keymap("n", "dL", "d$")
keymap("n", "dH", "d^")

keymap("n", "<tab>", ":lua switch_file_extension()<CR>", { noremap = true, silent = true })

-- greatest remap ever
keymap("v", "p", [["_dP]])

-- next greatest remap ever : asbjornHaland
keymap("n", "<leader>y", [["+y]])
keymap("v", "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])

keymap({ "n", "v" }, "<leader>d", [["_d]])

keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

keymap("v", "<leader>r", "ykoconsole.log(<esc>pA);<esc>yykpf(a'<esc>f)i'<esc>jj0")
