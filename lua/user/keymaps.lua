local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- BASIC EDITING (you don't need any plugins to use this)
-- LEADER
vim.g.mapleader = " "

-- INSERT
-- exit insert
keymap("i", "kj", "<Esc>", opts)

-- NORMAL
-- quit (this exit vim if have one buffer)
keymap("n", "<leader>q", ":quit<CR>", opts)

-- save
keymap("n", "<leader>w", ":write<CR>", opts)

-- better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- close buffers
keymap("n", "<leader>c", ":Bdelete %<CR>", opts)

-- split editor
keymap("n", "<leader>vs", ":vsplit<CR>", opts)
keymap("n", "<leader>hs", ":split<CR>", opts)

-- clear highlights
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)

-- delete a word backwards
keymap("n", "db", 'vb"_d')

-- VISUAL
-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- TWO OR MORE MODES
-- '-' to go end of line
keymap({ "n", "v" }, "-", "$", opts)

-- PLUGINS
-- open/close file explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
