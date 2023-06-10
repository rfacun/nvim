-- Dependencies needed: fd, ripgrep, fzf
local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fp', builtin.git_status, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fm', builtin.man_pages, {})
vim.keymap.set('n', '<leader>fc', builtin.commands, {})

-- Settings
telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,  -- Quit in insert mode
        ["<C-u>"] = false,          -- Clear prompt
        -- Move telescope selection
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        -- Scroll preview panel
        ["<C-l>"] = actions.preview_scrolling_down,
        ["<C-h>"] = actions.preview_scrolling_up
        -- Scroll results panel
        --["<C-p>"] = actions.results_scrolling_down,
        --["<C-n>"] = actions.results_scrolling_up,
      }
    }
  }
}

-- Load the extensions
telescope.load_extension('fzf')
