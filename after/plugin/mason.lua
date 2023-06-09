-- Dependencies needed: git, curl/wget, unzip, tar, gzip
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_null_ls = require("mason-null-ls")

-- Enable Mason
mason.setup()

-- LSP servers
mason_lspconfig.setup({
   ensure_installed = { "clangd", "bashls", "pyright", "lua_ls" }
})

-- Linters
mason_null_ls.setup({
   ensure_installed = { "mypy", "ruff", "black" }
})
