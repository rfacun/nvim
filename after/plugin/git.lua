-- Gitsigns
local git_signs = require("gitsigns")
git_signs.setup()

-- Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
