local npairs_ok, npairs = pcall(require, "nvim-autopairs")
if not npairs_ok then
  return
end

local config = {
  check_ts = true, -- treesitter integration
  disable_filetype = { "TelescopePrompt", "template_string" },

  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false
  },

  fast_wrap = {
    map = "<A-e>",
    chars = { "{", "[", "(", "'", '"' },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0, -- Offset from pattern match
    end_key = "-",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "Pmenusel",
    highlight_grey = "LineNr"
  }
}

npairs.setup(config)

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_ok, cmp = pcall(require, "cmp")

if not cmp_ok then
  return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({}))