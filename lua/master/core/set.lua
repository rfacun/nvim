-- Unify the clipboard
vim.cmd("set clipboard+=unnamedplus")

-- Visual
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = true
vim.opt.guicursor = ""
vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 50

-- QoL
vim.opt.iskeyword:append("-")
vim.opt.iskeyword:append("_")
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 3
vim.opt.wrap = false

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Default indentation
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Indentation: 2 spaces
vim.api.nvim_create_autocmd("FileType", {
   pattern = { "html", "css" },
   callback = function()
      vim.opt.softtabstop = 2
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
      vim.opt.smartindent = true
   end
})

-- Indentation: 3 spaces (really lua, really...)
vim.api.nvim_create_autocmd("FileType", {
   pattern = { "lua" },
   callback = function()
      vim.opt.softtabstop = 3
      vim.opt.tabstop = 3
      vim.opt.shiftwidth = 3
      vim.opt.expandtab = true
      vim.opt.smartindent = true
   end
})
