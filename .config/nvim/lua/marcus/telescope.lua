require('telescope').setup {
    defaults = {
        layout_config = {
            vertical = { width = 0.6 }
        },
        layout_strategy = "vertical",
        sorting_strategy = "ascending",
        color_devicons = true,
        selection_strategy = "reset",
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            -- even more opts
            }
        },
        fzf = {
          fuzzy = true,
          override_generic_sorter = false,
          override_file_sorter = true,
          case_mode = "smart_case",
        }
    }
}

require('telescope').load_extension('fzf')
require("telescope").load_extension("ui-select")
