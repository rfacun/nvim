local ensure_packer = function()
   local fn = vim.fn
   local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
   if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd [[packadd packer.nvim]]
      return true
   end
   return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
   -- Packer itself
   use { 'wbthomason/packer.nvim' }

   -- Color
   use { "Shatur/neovim-ayu" }
   use { 'nvim-treesitter/nvim-treesitter',
      run = function()
         local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
         ts_update()
      end,
   }

   -- Movement
   use { "ThePrimeagen/harpoon",
      requires = { "nvim-lua/plenary.nvim" }
   }
   use { 'nvim-telescope/telescope.nvim', branch = '0.1.x',
      requires = {
         { 'nvim-lua/plenary.nvim' },
         { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
      }
   }

   -- Mason is used to manage and install external editor tooling such as:
   -- LSP servers, DAP servers, linters and formatters
   use { "williamboman/mason.nvim", run = ":MasonUpdate" }

   -- LSP
   use { "williamboman/mason-lspconfig.nvim" }
   use { "neovim/nvim-lspconfig" }

   -- Autocompletion
   use { "hrsh7th/nvim-cmp" }
   -- Sources
   use { "hrsh7th/cmp-nvim-lsp" }      -- LSP
   use { "saadparwaiz1/cmp_luasnip" }  -- Snippets
   use { "hrsh7th/cmp-buffer" }        -- Buffer
   use { "hrsh7th/cmp-path" }          -- Files and folders directories
   --use { "hrsh7th/cmp-cmdline" }       -- Command line suggestions

   -- Snippets
   use { "L3MON4D3/LuaSnip",  -- Snippet engine
      requires = { "rafamadriz/friendly-snippets" } -- Snippets collection
   }

   -- Linting
   use { "jay-babu/mason-null-ls.nvim" }
   use { "jose-elias-alvarez/null-ls.nvim" }

   -- DAP
   use { "jay-babu/mason-nvim-dap.nvim" }
   use { "mfussenegger/nvim-dap" }
   use { "mfussenegger/nvim-dap-python" }
   use { "rcarriga/nvim-dap-ui" }

   -- QoL
   use { "mbbill/undotree" }
   use { "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
   }

   -- Git integration
   use { "tpope/vim-fugitive" }
   use { "lewis6991/gitsigns.nvim" }

   if packer_bootstrap then
      require('packer').sync()
   end
end)
