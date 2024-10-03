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

map('n', "<leader>n", ':tabnew $PWD<CR>')
map('n', "<leader>d", ':tabclose<CR>')

map('n', "<leader>j", ':+tabnext<CR>')
map('n', "<leader>;", ':-tabnext<CR>')

map('n', "<leader>0", '0gt')
map('n', "<leader>1", '1gt')
map('n', "<leader>2", '2gt')
map('n', "<leader>3", '3gt')
map('n', "<leader>4", '4gt')
map('n', "<leader>5", '5gt')
map('n', "<leader>6", '6gt')
map('n', "<leader>7", '7gt')
map('n', "<leader>8", '8gt')
map('n', "<leader>9", '9gt')
