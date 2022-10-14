local create_autocmd = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup

local definitions = {
  {
    "TextYankPost",
    {
      group = "_general_settings",
      pattern = "*",
      desc = "Highlight text on yank",
      callback = function()
        require("vim.highlight").on_yank { higroup = "Search", timeout = 100 }
      end
    }
  },
  {
    "Filetype",
    {
      group = "_buffer_mappings",
      desc = "Exit filetypes below just by pressing q",
      pattern = { "qf", "help", "man", "floaterm", "lspinfo", "lsp-installer", "null-ls-info" },
      command = "nnoremap <silent> <buffer> q :close<CR>"
    }
  },
  {
    { "BufWinEnter", "BufRead", "BufNewFile" },
    {
      group = "_format_options",
      desc = "Influence how vim formats text. See :help fo-table",
      pattern = "*",
      command = "setlocal formatoptions-=c formatoptions-=r formatoptions -=o"
    }
  },
  {
    "VimResized",
    {
      group = "_auto_resize",
      desc = "Resize splits in vim automatically across tabs",
      pattern = "*",
      command = "tabdo wincmd ="
    }
  }
}

for _, entry in ipairs(definitions) do
  local event = entry[1]
  local opts = entry[2]
  if type(opts.group) == "string" and opts.group ~= "" then
    local exists, _ = pcall(vim.api.nvim_get_autocmds, { group = opts.group })
    if not exists then
      create_augroup(opts.group, {})
    end
  end
  create_autocmd(event, opts)
end

-- function to call autocmd to enable transparent mode
local M = {}
function M.enable_transparent_mode()
  create_autocmd("Colorscheme", {
    pattern = "*",
    callback = function ()
      local hl_groups = {
        "Normal",
        "SignColumn",
        "NormalNC",
        "TelescopeBorder",
        "NvimTreeNormal",
        "EndOfBuffer",
        "MsgArea"
      }
      for _, name in ipairs(hl_groups) do
        vim.cmd(string.format("highlight %s ctermbg=none guibg=none", name))
      end
    end
  })
  vim.opt.fillchars = "eob: "
end
return M
