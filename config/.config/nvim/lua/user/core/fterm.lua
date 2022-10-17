local ok, fterm = pcall(require, "FTerm")
if not ok then
  return
end


local config = {
  -- filetype of the terminal buffer
  ft = "FTerm",
  -- command to run inside the terminal
  -- for windows use "pwsh.exe" or "powershell.exe"
  cmd = os.getenv("SHELL"),
  -- neovim's native window border. See `:h nvim_open_win` for more options
  border = "single",
  -- close the terminal as soon as shell/command exits.
  -- disabling this will mimic the native terminal behaviour.
  auto_close = true,
  -- highlight group for the terminal. See `:h winhl`
  hl = 'Normal',

  -- transparency of the floating window. See `:h winblend`
  blend = 0,

  -- object containing the terminal window dimensions.
  -- the value for each field should be between `0` and `1`
  dimensions = {
      height = 0.8, -- height of the terminal window
      width = 0.8, -- width of the terminal window
      x = 0.5, -- X axis of the terminal window
      y = 0.5, -- Y axis of the terminal window
  },

  -- callback invoked when the terminal exits.
  -- see `:h jobstart-options`
  on_exit = nil,

  -- callback invoked when the terminal emits stdout data.
  -- see `:h jobstart-options`
  on_stdout = nil,

  -- callback invoked when the terminal emits stderr data.
  -- see `:h jobstart-options`
  on_stderr = nil,
}

fterm.setup(config)

local create_user_command = vim.api.nvim_create_user_command
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

create_user_command("FTermToggle", require("FTerm").toggle, { bang = true })
create_user_command("FTermExit", require("FTerm").exit, { bang = true })

keymap("n", "<A-i>", ":FTermToggle<CR>", opts)
keymap("t", "<A-i>", "<C-\\><C-n>:FTermToggle<CR>", opts)
keymap("t", "<A-k>", "<C-\\><C-n>:FTermExit<CR>", opts)

local lazygit = fterm:new({
  ft = "fterm_lazygit",
  cmd = "lazygit",
  dimensions = {
    height = 0.9,
    width = 0.9
  }
})

keymap("n", "<leader>gg", function () lazygit:toggle() end, opts)

