function map (mode, keymap, result)
	vim.keymap.set(mode, keymap, result)
end


vim.g.mapleader = " "
map("n", "<leader>x", vim.cmd.Ex)
