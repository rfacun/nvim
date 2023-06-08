-- Ayu settings
require('ayu').setup({
   -- Set to "true" to use "mirage" instead of "dark" for dark background
   mirage = false,

   -- A dictionary of group names, each associated with a dictionary
   -- of parameters ("bg", "fg", "sp" and "style") and colors in hex
   overrides = {},
})

-- Set the colorscheme
vim.cmd("colorscheme ayu")
