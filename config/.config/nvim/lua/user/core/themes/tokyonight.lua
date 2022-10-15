local ok, tokyonight = pcall(require, "tokyonight")
if not ok then
  return
end

local config = {
  style = "night", -- the theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  transparent = false, -- enable this to disable setting the background color
  terminal_colors = true, -- configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- style to be applied to different syntax groups
    -- value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
   -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
   sidebars = {
    "qf",
    "vista_kind",
    "terminal",
    "packer",
    "spectre_panel",
    "NeogitStatus",
    "help",
  },
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
  use_background = true, -- can be light/dark/auto. When auto, background will be set to vim.o.background

  -- You can override specific highlights to use other groups or a hex color
  -- function will be called with a Highlights and ColorScheme table
  on_highlights = function (hl, c)
    hl.IndentBlanklineContextChar = {
      fg = c.dark5,
    }
    hl.TSConstructor = {
      fg = c.blue1,
    }
    hl.TSTagDelimiter = {
      fg = c.dark5,
    }
    -- if you want to make telescope borderless, uncomment lines below
    -- local prompt = "#2d3149"
    -- hl.TelescopeNormal = {
    --   bg = c.bg_dark,
    --   fg = c.fg_dark,
    -- }
    -- hl.TelescopeBorder = {
    --   bg = c.bg_dark,
    --   fg = c.bg_dark,
    -- }
    -- hl.TelescopePromptNormal = {
    --   bg = prompt,
    -- }
    -- hl.TelescopePromptBorder = {
    --   bg = prompt,
    --   fg = prompt,
    -- }
    -- hl.TelescopePromptTitle = {
    --   bg = prompt,
    --   fg = prompt,
    -- }
    -- hl.TelescopePreviewTitle = {
    --   bg = c.bg_dark,
    --   fg = c.bg_dark,
    -- }
    -- hl.TelescopeResultsTitle = {
    --   bg = c.bg_dark,
    --   fg = c.bg_dark,
    -- }
  end
}

tokyonight.setup(config)

vim.cmd("colorscheme tokyonight")