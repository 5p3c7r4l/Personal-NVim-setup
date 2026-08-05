-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, keymap, result)
  vim.keymap.set(mode, keymap, result)
end

vim.g.mapleader = " "
map("n", "<leader>x", vim.cmd.Ex)

map("v", "K", ":m '>+1<CR>gv=gv")
map("v", "L", ":m '<-2<CR>gv=gv")

map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

map("x", "<C-p>", '"_dP')

map("n", "<leader>v", ":let @/=''<CR>")

map("n", "j", "h")
map("n", "k", "j")
map("n", "l", "k")
map("n", ";", "l")
map("v", "j", "h")
map("v", "k", "j")
map("v", "l", "k")
map("v", ";", "l")

map("n", "<leader>n", ":tabnew $PWD<CR>")
map("n", "<leader>d", ":tabclose<CR>")

map("n", "<leader>j", ":+tabnext<CR>")
map("n", "<leader>;", ":-tabnext<CR>")
