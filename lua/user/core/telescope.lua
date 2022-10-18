local function get_pickers(actions)
  return {
    find_files = {
      theme = "dropdown", -- or "cursor" or "ivy"
      hidden = true,
      previewer = false,
    },
    live_grep = {
      -- usage don't include the filename in the search results
      only_sort_text = true,
    },
    buffers = {
      theme = "dropdown",
      previewer = false,
      initial_mode = "normal",
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer,
        },
        n = {
          ["dd"] = actions.delete_buffer,
        },
      },
    },
    lsp_references = {
      -- theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_definitions = {
      -- theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_declarations = {
      -- theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_implementations = {
      -- theme = "dropdown",
      initial_mode = "normal",
    },
  }
end

local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

local actions = require("telescope.actions")
local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")

local icons = require("user.icons")

local config = {
  defaults = {
    prompt_prefix = icons.ui.Telescope .. " ",
    selection_caret = icons.ui.Forward .. " ",
    entry_prefix = " ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
        width = 0.75,
        preview_cutoff = 120,
        horizontal = {
          preview_width = function(_, cols, _)
            if cols < 120 then
              return math.floor(cols * 0.5)
            end
            return math.floor(cols * 0.6)
          end,
          mirror = false,
        },
        vertical = { mirror = false },
      },
    mappings = {
      n = {
        ["q"] = actions.close,
        ["<S-j>"] = actions.preview_scrolling_down,
        ["<S-k>"] = actions.preview_scrolling_up,
      },
      i = {
        ["<C-c>"] = actions.close,
        ["Down"] = actions.cycle_history_next,
        ["Up"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<S-j>"] = actions.preview_scrolling_down,
        ["<S-k>"] = actions.preview_scrolling_up,
      }
    },
    pickers = get_pickers(actions),
    file_ignore_patterns = {},
    path_display = { "smart" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
  },
  pickers = get_pickers(actions),
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact match
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case" -- or "ignore_case" or "respect_case"
    }
  },
  file_previewer = previewers.vim_buffer_cat.new,
  grep_previewer = previewers.vim_buffer_vimgrep.new,
  qflist_previewer = previewers.vim_buffer_qflist.new,
  file_sorter = sorters.get_fuzzy_file,
  generic_sorter = sorters.get_generic_fuzzy_sorter,
}

telescope.setup(config)

-- load extensions after telescope config (make sure to install plugin extensions)
telescope.load_extension("fzf")
