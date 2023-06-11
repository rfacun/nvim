-- Dependencies needed: git, curl/wget, unzip, tar, gzip
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_null_ls = require("mason-null-ls")
local mason_nvim_dap = require("mason-nvim-dap")

-- Enable Mason
mason.setup()

-- LSP servers
mason_lspconfig.setup({
   ensure_installed = {
      "bashls",
      "pyright",
      "lua_ls"
   }
})

-- Linters and formatters
mason_null_ls.setup({
   ensure_installed = {
      "shellcheck", "shfmt",
      "mypy", "ruff", "black",
      "luacheck", "luaformatter" -- Install luarocks

   }
})

-- DAP servers
mason_nvim_dap.setup({
   ensure_installed = { "debugpy" }
})
