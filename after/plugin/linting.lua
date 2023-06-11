local null_ls = require("null-ls")
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions

-- Format code when saving
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
   sources = {
      -- Shell scripts
      code_actions.shellcheck,
      formatting.shfmt,

      -- Python
      formatting.black,
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
         }
      }),

      -- Lua
      diagnostics.luacheck,
      formatting.lua_format

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
