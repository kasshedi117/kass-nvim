vim.g.mapleader = " "

vim.keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })
vim.keymap.set("i", "[[", "<ESC>", { desc = "Exit insert mode with [[" })
vim.keymap.set("i", "[j", "<ESC>", { desc = "Exit insert mode with [[" })

vim.keymap.set("n", "vw", "viw")
vim.keymap.set("n", "vj", "vi[")
vim.keymap.set("n", "vu", "vi(")
vim.keymap.set("n", "vl", "vi{")
vim.keymap.set("n", "vm", "vi{")
vim.keymap.set("n", "va", 'vi"')
vim.keymap.set("n", "vr", "vi'")

vim.keymap.set("n", "v$", "vaW")
vim.keymap.set("n", "v[", "va[")
vim.keymap.set("n", 'v"', "va(")
vim.keymap.set("n", "v(", "va(")
vim.keymap.set("n", "v{", "va{")
vim.keymap.set("n", "v'", 'va"')

vim.keymap.set("n", "cw", "ciw")
vim.keymap.set("n", "cj", "ci[")
vim.keymap.set("n", "cu", "ci(")
vim.keymap.set("n", "cl", "ci{")
vim.keymap.set("n", "cm", "ci{")
vim.keymap.set("n", "ca", 'ci"')
vim.keymap.set("n", "cr", "ci'")

vim.keymap.set("n", "c$", "caw")
vim.keymap.set("n", "c[", "ca[")
vim.keymap.set("n", 'c"', "ca(")
vim.keymap.set("n", "c(", "ca(")
vim.keymap.set("n", "c{", "ca{")
vim.keymap.set("n", "c'", 'ca"')

vim.keymap.set("n", "dw", "diw")
vim.keymap.set("n", "dj", "di[")
vim.keymap.set("n", "du", "di(")
vim.keymap.set("n", "dl", "di{")
vim.keymap.set("n", "dm", "di{")
vim.keymap.set("n", "dr", 'di"')
vim.keymap.set("n", "da", "di'")

vim.keymap.set("n", "d$", "daw")
vim.keymap.set("n", "d[", "da[")
vim.keymap.set("n", 'd"', "da(")
vim.keymap.set("n", "d(", "da(")
vim.keymap.set("n", "d{", "da{")
vim.keymap.set("n", "d'", 'da"')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-l>", "<C-W>l")

-- keymap("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "(", "<C-u>zz", { nowait = true })
vim.keymap.set("n", "&", "<C-d>zz", { nowait = true })

vim.keymap.set("n", "<S-]>", "<C-y>", { nowait = true })
vim.keymap.set("n", "<S-[>", "<C-e>", { nowait = true })

vim.keymap.set("n", "[]", "<nop>")
vim.keymap.set("n", "[%", "<nop>")
vim.keymap.set("n", "[m", "<nop>")
vim.keymap.set("n", "[d", "<nop>")
vim.keymap.set("n", "]%", "<nop>")
vim.keymap.set("n", "]m", "<nop>")
vim.keymap.set("n", "]I", "<nop>")
vim.keymap.set("n", "]d", "<nop>")
vim.keymap.set("n", "[I", "<nop>")

vim.keymap.set("n", "{", "f", { nowait = true })
vim.keymap.set("n", "\\", "F", { nowait = true })
vim.keymap.set("v", "{", "f", { nowait = true })
vim.keymap.set("v", "\\", "F", { nowait = true })

vim.keymap.set("n", "dL", "d$")
vim.keymap.set("n", "dH", "d^")

vim.keymap.set("n", "<S-l>", "$", { nowait = true })
vim.keymap.set("n", "<S-h>", "^", { nowait = true })
vim.keymap.set("v", "<S-l>", "$h", { nowait = true })
vim.keymap.set("v", "<S-h>", "^", { nowait = true })

vim.keymap.set("n", "γ", "<C-y>", { nowait = true })
vim.keymap.set("n", "δ", "<C-e>", { nowait = true })

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set({ "v" }, "p", [["_dP]]) -- paste with keeping register
-- vim.keymap.set({ "v" }, "<leader>p", [["+p]]) -- paste from system clipboard

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- copy to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
