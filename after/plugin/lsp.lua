local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- These mappings are only available when an LSP server is running
local on_attach = function(client, bufnr)
   local opts = { buffer = bufnr, remap = false }

   -- Diagnostics
   vim.keymap.set('n', '<space>e', function() require("telescope.builtin").diagnostics() end, opts)
   --vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
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

-- Disable inline diagnostics 
vim.diagnostic.config({
   virtual_text = false
})

-- Server configuration
lspconfig["clangd"].setup({
   on_attach = on_attach,
   capabilities = capabilities
})

lspconfig["bashls"].setup({
   on_attach = on_attach,
   capabilities = capabilities
})

lspconfig["pyright"].setup({
   on_attach = on_attach,
   capabilities = capabilities
})

lspconfig["lua_ls"].setup({
   on_attach = on_attach,
   capabilities = capabilities,
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
