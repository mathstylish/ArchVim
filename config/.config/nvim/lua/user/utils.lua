local M = {}

function M.set_clipboard()
  local is_win = vim.fn.has "win32"

  if is_win then
    vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }
  else
    vim.opt.clipboard:append { 'unnamedplus' }
  end
end

return M
