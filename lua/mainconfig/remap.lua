local function map (mode, keymap, result)
    vim.keymap.set(mode, keymap, result)
end


vim.g.mapleader = " "
map("n", "<leader>x", vim.cmd.Ex)

map("v", "K", ":m '>+1<CR>gv=gv")
map("v", "L", ":m '<-2<CR>gv=gv")

map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

map("x", "<C-p>", "\"_dP")

map("n", "<leader>v", ":let @/=''<CR>")

map("n","j","h")
map("n","k","j")
map("n","l","k")
map("n",";","l")
map("v","j","h")
map("v","k","j")
map("v","l","k")
map("v",";","l")
