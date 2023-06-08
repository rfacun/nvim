-- Leader
vim.g.mapleader = " "

-- Netrw
vim.keymap.set("n", "<leader>rw", vim.cmd.Ex)

-- Move selected around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Cursor stays in the middle when doing Ctrl+d/Ctrl+u
vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz")
vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz")

-- Same when cycling search matches
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Replace all ocurrences of string under cursor in the entire file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Source file
vim.keymap.set("n", "<leader><leader>", function()
   vim.cmd("so")
end)

-- Sync plugins
vim.keymap.set("n", "<leader>ps", function()
   vim.cmd("PackerSync")
end)
