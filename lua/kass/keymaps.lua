local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Sorten function name
local keymap = vim.api.nvim_set_keymap

-- Rename Space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("i", "jj", "<Esc>", opts)
keymap("i", "bb", "/*", opts)
keymap("i", "nn", "*/", opts)
keymap("i", "BB", "<!--", opts)
keymap("i", "NN", "-->", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "p", '"_dP', opts)

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>p", "<cmd>Telescope projects<CR>", opts)

-- bufferLine
keymap("n", "<leader>q", ":Bdelete!<cr>", opts)


-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- harpoon
keymap("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", opts )
keymap("n", "<leader>z", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts )
keymap("n", "<leader>&", ":lua require('harpoon.ui').nav_file(1)<CR>", opts )
keymap("n", "<leader>é", ":lua require('harpoon.ui').nav_file(2)<CR>", opts )
keymap("n", "<leader>\"", ":lua require('harpoon.ui').nav_file(3)<CR>", opts )
keymap("n", "<leader>'", ":lua require('harpoon.ui').nav_file(4)<CR>", opts )
keymap("n", "<leader>(", ":lua require('harpoon.ui').nav_file(5)<CR>", opts )
keymap("n", "<leader>-", ":lua require('harpoon.ui').nav_file(6)<CR>", opts )
keymap("n", "<leader>è", ":lua require('harpoon.ui').nav_file(7)<CR>", opts )
keymap("n", "<leader>_", ":lua require('harpoon.ui').nav_file(8)<CR>", opts )


keymap("n", "<leader>t", ":Tagbar<CR>", opts )


