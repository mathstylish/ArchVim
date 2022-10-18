local utils = require('user.utils')

utils.set_clipboard() -- set system clipboard according your OS

local options = {
  backup = false,                                           -- don't create a backup file
  cmdheight = 1,                                            -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" },
  guifont = "monospace:h17",                                -- the font used in graphical neovim applications
  hidden = true,                                            -- required to keep multiple buffers and open multiple buffers
  hlsearch = true,                                          -- highlight all matches on previous search pattern
  ignorecase = true,                                        -- ignore case in search patterns
  mouse = "a",                                              -- allow the mouse to be used in neovim
  pumheight = 10,                                           -- pop up menu height
  showmode = false,                                         -- stop seeing things like -- INSERT --, -- NORMAL --
  showtabline = 2,                                          -- always show tabs
  smartcase = true,
  splitbelow = true,                                        -- force all horizontal splits to go below current window
  splitright = true,                                        -- force all vertical splits to go to right of current window
  termguicolors = true,                                     -- set termguicolors (most terminals support this)
  timeoutlen = 1000,                                        -- time to wait for a mapped sequence to complete (in milliseconds) 
  title = true,                                             -- set the title of window to the value of the title string
  updatetime = 100,                                         -- faster completion
  writebackup = false,                                      -- if a file is being edited by another program (or was written tofile while editing with another program), it is not allowd to be edited
  showcmd = false,
  ruler = false,
  laststatus = 3,
  conceallevel = 0,                                         -- so that `` is visible in markdown files
  foldmethod = "manual",                                    -- folding, set to "expr" for treesitter based folding
  foldexpr = "",                                            -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
  cursorline = true,                                        -- highlight the current line
  number = true,                                            -- set numbered lines
  relativenumber = true,                                    -- relative line numbers to current line
  numberwidth = 4,                                          -- set number column width
  signcolumn = "yes",                                       -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                                             -- display lines as one long line
  scrolloff = 8,                                            -- minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 8,                                        -- minimal number of screen lines to keep left and right of the cursor
  fileencoding = "utf-8",                                   -- the encoding written to a file
  smartindent = true,                                       -- make indenting smart again
  swapfile = false,                                         -- don't create a swapfile
  undofile = true,                                          -- enable persistent undo
  expandtab = true,                                         -- convert tabs to spaces
  shiftwidth = 2,                                           -- the number of spaces inserted for each indentation
  tabstop = 2,                                              -- insert 2 spaces for a tab
}

vim.opt.shortmess:append "c" -- don't show redundant messages from ins-completion-menu
vim.opt.shortmess:append "I" -- don't show the default intro message
vim.opt.whichwrap:append "<,>,[,],h,l"

for k, v in pairs(options) do
  vim.opt[k] = v
end
