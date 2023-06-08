-- Dependencies needed: fd, ripgrep, fzf
local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fp', builtin.git_files, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fm', builtin.man_pages, {})

-- Settings
telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,  -- Quit in insert mode
        ["<C-u>"] = false,          -- Clear prompt
        -- Move inside telescope
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous
      }
    }
  }
}

-- Load the extensions
telescope.load_extension('fzf')
