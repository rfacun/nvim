-- Dependencies needed: git, curl/wget, unzip, tar, gzip
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- Enable Mason
mason.setup()

-- LSP servers
mason_lspconfig.setup({
   ensure_installed = { "clangd", "bashls", "pyright", "lua_ls" }
})
