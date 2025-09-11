vim.g.mapleader = " "
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", {})
vim.keymap.set("n", "+", "<CMD>Neotree<CR>", {})
vim.keymap.set("n", "<C-t>", "<CMD>tabnew<CR>", {})
vim.keymap.set("n", "<C-q>", "<CMD>q<CR>", {})
vim.keymap.set("n", "<C-s>", "<CMD>w<CR>", {})
vim.keymap.set("n","<leader>a","<CMD>FloatermNew<CR>", {})
vim.keymap.set("n","<C-e>","<CMD>FloatermNext<CR>")
vim.keymap.set("n", "<leader>f", "<CMD>FzfLua files<CR>", {})
vim.keymap.set("n", "-", "<CMD>FzfLua<CR>", {})

