local ok, indent_blankline = pcall(require, "indent_blankline")
if not ok then
  return
end

local icons = require("user.icons")

local config = {
  char = icons.ui.LineLeft,
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  use_treesitter = true,
  show_current_context = true,
  buftype_exclude = { "terminal", "nofile" },
  filetype_exclude = {
    "help",
    "packer",
    "NvimTree"
  }
}

indent_blankline.setup(config)