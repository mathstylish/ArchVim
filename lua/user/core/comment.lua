local comment_ok, comment = pcall(require, "Comment")
if not comment_ok then
  return
end

local pre_hook = function(context)
  local c_utils = require "Comment.utils"

  local tsc_utils_ok, tsc_utils = pcall(require, "ts_context_commentstring.utils")
  if not tsc_utils_ok then
    return
  end

  local location = nil
  if context.ctype == c_utils.ctype.block then
    location = tsc_utils.get_cursor_location()
  elseif context.cmotion == c_utils.cmotion.v or context.cmotion == c_utils.cmotion.V then
    location = tsc_utils.get_visual_start_location()
  end

  local internals_ok, internals = pcall(require, "ts_context_commentstring.internals")
  if not internals_ok then
    return
  end

  return internals.calculate_commentstring {
    key = context.ctype == c_utils.ctype.line and "__default" or "__multiline",
    location = location,
  }
end

comment.setup({ pre_hook })