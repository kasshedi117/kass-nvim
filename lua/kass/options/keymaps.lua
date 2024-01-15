vim.g.mapleader = " "
local keymap = vim.keymap.set

keymap("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })
keymap("i", "[[", "<ESC>", { desc = "Exit insert mode with [[" })
keymap("i", "[j", "<ESC>", { desc = "Exit insert mode with [[" })

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- keymap("n", "J", "mzJ`z")
keymap("n", "J", "G")
keymap("n", "K", "gg")
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
keymap("n", "<C-h>", "<C-W>h")
keymap("n", "<C-j>", "<C-W>j")
keymap("n", "<C-k>", "<C-W>k")
keymap("n", "<C-l>", "<C-W>l")

keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

keymap("n", "dL", "d$")
keymap("n", "dH", "d^")

keymap("v", "p", [["_dP]])

keymap("n", "<leader>y", [["+y]])
keymap("v", "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])

keymap({ "n", "v" }, "<leader>d", [["_d]])