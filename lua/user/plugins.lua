local fn = vim.fn

-- automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- autoreload this file on save to update/install/remove plugins
local group = vim.api.nvim_create_augroup("packer_user_config", {})
vim.api.nvim_create_autocmd("BufWritePost", {
  group = group,
  pattern = "plugins.lua",
  callback = function()
    local buf = fn.expand("%")
    vim.schedule(function()
      vim.cmd("source "..buf.." | PackerSync")
    end)
  end
})

-- use a protected call so we don't error out on first use
local ok, packer = pcall(require, "packer")
if not ok then
  return
end

-- have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end
  }
})

-- install your plugins here
return packer.startup(function(use)
  use({ "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" }) -- have packer manage itself
  use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" } -- useful lua functions used by lots of plugins
  -- the bare minimum that i think an editor should have to get started
  use({ "windwp/nvim-autopairs", commit = "5d75276fce887c0cf433bb1b9867717907211063" }) -- autopairs, integrates with both cmp and treesitter
  use({ "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" }) -- comment your code
  use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "32d9627123321db65a4f158b72b757bcaef1a3f4" }) -- change comment plugin behavior
  use({ "kyazdani42/nvim-tree.lua", commit = "b17358ff4d822deeb42b97919065800f8f91cb55" }) -- file explorer
  use({ "akinsho/bufferline.nvim", commit = "c78b3ecf9539a719828bca82fc7ddb9b3ba0c353" }) -- tab bar
  use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }) -- change delete buffers and close files behavior
  use({ "nvim-lualine/lualine.nvim", commit = "b6314ac556098d7abea9bb8cf896d2e3500eca41" }) -- statusbar
  use({ "numToStr/FTerm.nvim", commit = "d1320892cc2ebab472935242d9d992a2c9570180" }) -- toggleable terminal (like integrated terminal)
  use({ "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" }) -- indent guides (including empty lines)
  use({ "goolord/alpha-nvim", commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94" }) -- have a menu to open file, find files... etc
  use("folke/which-key.nvim") -- you i'll never forget your keymaps

  -- colorschemes
  use({ "folke/tokyonight.nvim", commit = "62b4e89ea1766baa3b5343ca77d62c817f5f48d0" })

  -- icon theme
  use({ "nvim-tree/nvim-web-devicons", commit = "189ad3790d57c548896a78522fd8b0d0fc11be31" })

  -- completion plugins (can come from sources like buffers, dir paths, snippets...)
  use({ "hrsh7th/nvim-cmp", commit = "93f385c17611039f3cc35e1399f1c0a8cf82f1fb" }) -- the completion plugin
  use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
  use({ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }) -- path completions
  use({ "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" }) -- snippet completions
  use({ "hrsh7th/cmp-nvim-lsp", commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb" }) -- lsp completions
  use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }) -- completions for lua runtime API

  -- snippets (have code structures boilerplates)
  use({ "L3MON4D3/LuaSnip", commit = "79f647218847b1cd204fede7dd89025e43fd00c3" }) --snippet engine
  use({ "rafamadriz/friendly-snippets", commit = "03f91a18022964d80a3f0413ed82cf1dbeba247f" }) -- a bunch of snippets to use

  -- LSP (features that all LP have like autocomplete, go to definition, declarations, implementations, warnings, errors, signatures... etc)
  use({ "neovim/nvim-lspconfig", commit = "abe6c99c7489de2c317869cf5dea57a9595a0cca" }) -- enable LSP
  use ({ "williamboman/mason.nvim", commit = "bfc5997e52fe9e20642704da050c415ea1d4775f" })
  use ({ "williamboman/mason-lspconfig.nvim", commit = "edf15b98cd7d7ce0f83cf7d3a968145a3f974772" })
  use({ "jose-elias-alvarez/null-ls.nvim", commit = "c51978f546a86a653f4a492b86313f4616412cec" }) -- for formatters and linters
  use({ "RRethy/vim-illuminate", commit = "a6d0b28ea7d6b9d139374be1f94a16bd120fcda3" })

  -- telescope (find, filter, preview, pick faster)
  use({ "nvim-telescope/telescope.nvim", commit = "cea9c75c19d172d2c6f089f21656019734a615cf" })
  use {"nvim-telescope/telescope-fzf-native.nvim", run = "make CC=gcc", commit = "65c0ee3d4bb9cb696e262bca1ea5e9af3938fc90" }
  use({ "ahmedkhalf/project.nvim", commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4" }) -- recent projects

  -- treesitter (parser generator tool and an incremental parsing library. Have better syntax highlighting and other things...)
  use({ "nvim-treesitter/nvim-treesitter", commit = "5d11dfc27849e3d7435c32dbd8ea9be35bcd990b" })

  -- git integration for buffers
  use({ "lewis6991/gitsigns.nvim", commit = "9ff7dfb051e5104088ff80556203634fc8f8546d" })

  -- improve startup time
  use { "lewis6991/impatient.nvim", commit = "d3dd30ff0b811756e735eb9020609fa315bfbbcc" }

  -- debug
  use { "mfussenegger/nvim-dap", commit = "bb6a98781e3a868d6f1de995f52d975396a7f208" }
  use { "rcarriga/nvim-dap-ui", commit = "54365d2eb4cb9cfab0371306c6a76c913c5a67e3" }
  use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }

  -- formatters
  use { "MunifTanjim/prettier.nvim" }

  -- automatically set up your configuration after cloning packer.nvim
  -- put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
