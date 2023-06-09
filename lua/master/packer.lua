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

   if packer_bootstrap then
      require('packer').sync()
   end
end)
