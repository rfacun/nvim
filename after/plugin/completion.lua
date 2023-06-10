local cmp = require("cmp")          -- Autocompletion plugin
local luasnip = require("luasnip")  -- Snippets engine

-- Autopairs support
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- Enable collection of snippets from VSCode
require("luasnip.loaders.from_vscode").lazy_load()

-- Required for "super tab" behavior
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
   -- Specify snippets engine
   snippet = {
      expand = function(args)
         luasnip.lsp_expand(args.body)
      end
   },

   -- Autocompletion sources
   sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
      { name = 'path' }
   },

   -- Mappings
   mapping = cmp.mapping.preset.insert({
      ['<C-p>'] = cmp.mapping.scroll_docs(-5),
      ['<C-n>'] = cmp.mapping.scroll_docs(5),
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }),

      -- Super tab (next field)
      ["<Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
            -- they way you will only jump inside the snippet region
         elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
         elseif has_words_before() then
            cmp.complete()
         else
            fallback()
         end
      end, { "i", "s" }),

      -- Super tab (prev field)
      ["<S-Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_prev_item()
         elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
         else
            fallback()
         end
      end, { "i", "s" })
   }),

   -- Appearance
   window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered()
   },

   -- Selection
   completion = {
      completeopt = 'menu,menuone,noinsert'
   },

   enabled = function()
      -- Autocompletion disabled for Telescope
		local buftype = vim.api.nvim_buf_get_option(0, "buftype")
		if buftype == "prompt" then return false end

      -- Autocompletion disabled for comments (when using Treesitter)
      local context = require("cmp.config.context")
      return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
   end
})
