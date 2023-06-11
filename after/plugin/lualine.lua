local lualine = require("lualine")

lualine.setup {
   options = {
      icons_enabled = true,
      theme = 'ayu',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = { statusline = {}, winbar = {} },
      ignore_focus = {},
      always_divide_middle = false,
      globalstatus = false,
      refresh = { statusline = 1000, tabline = 1000, winbar = 1000 }
   },

   sections = {
      lualine_a = {
         { 'mode' }
      },
      lualine_b = {
         { 'branch' },
         { 'diff' },
         { 'diagnostics', sources = { 'nvim_diagnostic' } }
      },
      lualine_c = {
         { 'filename', file_status = true, newfile_status = true, path = 2 }
      },

      lualine_x = {
         { 'filesize' },
         { 'filetype' },
         { 'fileformat' },
      },
      lualine_y = {
         { 'location' }
      },
      lualine_z = {
         { 'progress' }
      }
   },

   inactive_sections = {
      lualine_a = {
         { 'mode' }
      },
      lualine_b = {
         { 'branch' },
         { 'diff' },
         { 'diagnostics', sources = { 'nvim_diagnostic' } }
      },
      lualine_c = {
         { 'filename', file_status = true, newfile_status = true, path = 2 }
      },

      lualine_x = {
         { 'filesize' },
         { 'filetype' },
         { 'fileformat' },
      },
      lualine_y = {
         { 'location' }
      },
      lualine_z = {
         { 'progress' }
      }
   },

   tabline = {},
   winbar = {},
   inactive_winbar = {},
   extensions = {}
}
