local lspconfig = require("lspconfig")

-- These mappings are only available when an LSP server is running
local on_attach = function(client, bufnr)
   local opts = { buffer = bufnr, remap = false }

   -- Diagnostics
   vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
   vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
   vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

   -- Buffer local mappings
   vim.keymap.set('n', 'gd', function() require("telescope.builtin").lsp_definitions() end, opts)
   vim.keymap.set('n', 'gr', function() require("telescope.builtin").lsp_references() end, opts)
   vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)  -- Check for manual entry
   vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
   vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)

   --vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
   --vim.keymap.set('n', '<leader>vws', function() require("telescope.builtin").lsp_workspace_symbols() end, opts)
   --vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

   -- Mappings specific to any language
   --if client.name == "pyright" then
   --end
end

-- Server configuration
lspconfig["clangd"].setup({
   on_attach = on_attach,
})

lspconfig["bashls"].setup({
   on_attach = on_attach,
})

lspconfig["pyright"].setup({
   on_attach = on_attach,
})

lspconfig["lua_ls"].setup({
   on_attach = on_attach,

   settings = {
      Lua = {
         diagnostics = {
            globals = { "vim" }
         },
         telemetry = {
            enable = false,
         }
      }
   }
})
