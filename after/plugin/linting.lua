local null_ls = require("null-ls")
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

-- Format code when saving
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
   sources = {
      -- Code formatting
      formatting.black,

      -- Actual linting
      diagnostics.mypy.with({
         diagnostic_config = {
            -- See :help vim.diagnostic.config()
            underline = true,
            virtual_text = false,
            signs = true,
            update_in_insert = false,
            severity_sort = true,
         }
      }),
      diagnostics.ruff.with({
         diagnostic_config = {
            -- See :help vim.diagnostic.config()
            underline = true,
            virtual_text = false,
            signs = true,
            update_in_insert = false,
            severity_sort = true,
         },
      })
   },

   -- Format code when saving
   on_attach = function(current_client, bufnr)
      if current_client.supports_method("textDocument/formatting") then
         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
         vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
               vim.lsp.buf.format({
                  filter = function(client)
                     --  Only use null-ls for formatting instead of lsp server
                     return client.name == "null-ls"
                  end,
                  bufnr = bufnr,
               })
            end,
         })
      end
   end,
})
