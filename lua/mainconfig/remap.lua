local function map (mode, keymap, result)
    vim.keymap.set(mode, keymap, result)
end


vim.g.mapleader = " "
map("n", "<leader>x", vim.cmd.Ex)

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<C-u>", "<C-U>zz")
map("n", "<C-d>", "<C-D>zz")

map("x", "<C-p>", "\"_dP")
