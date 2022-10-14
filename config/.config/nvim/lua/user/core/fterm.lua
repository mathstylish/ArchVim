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

-- ntop
local ntop = fterm:new({
  ft = "fterm_ntop",
  cmd = "ntop",
  dimensions = {
    height = 0.9,
    width = 0.9
  }
})
