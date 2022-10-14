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
  use({ "wbthomason/packer.nvim", commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422" }) -- have packer manage itself

  -- the bare minimum that i think an editor should have to get started
  use({ "windwp/nvim-autopairs", commit = "fa6876f832ea1b71801c4e481d8feca9a36215ec" }) -- autopairs, integrates with both cmp and treesitter
  use({ "numToStr/Comment.nvim", commit = "2c26a00f32b190390b664e56e32fd5347613b9e2" }) -- comment your code
  use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269" }) -- change comment plugin behavior
  use({ "kyazdani42/nvim-tree.lua", commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243" }) -- file explorer
  use({ "akinsho/bufferline.nvim", commit = "c78b3ecf9539a719828bca82fc7ddb9b3ba0c353" }) -- tab bar
  use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }) -- change delete buffers and close files behavior
  use({ "nvim-lualine/lualine.nvim", commit = "3362b28f917acc37538b1047f187ff1b5645ecdd" }) -- statusbar
  use({ "akinsho/toggleterm.nvim", commit = "aaeed9e02167c5e8f00f25156895a6fd95403af8" }) -- toggleable terminal (like integrated terminal)
  use({ "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" }) -- recent projects
  use({ "lukas-reineke/indent-blankline.nvim", commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2" }) -- indent guides (including empty lines)
  use({ "goolord/alpha-nvim", commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94" }) -- have a menu to open file, find files... etc
  use("folke/which-key.nvim") -- you i'll never forget your keymaps

  -- colorschemes
  use({ "folke/tokyonight.nvim", commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb" })

  -- completion plugins (can come from sources like buffers, dir paths, snippets...)
  use({ "hrsh7th/nvim-cmp", commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a" }) -- the completion plugin
  use({ "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" }) -- buffer completions
  use({ "hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" }) -- path completions
  use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- snippet completions
  use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }) -- lsp completions
  use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }) -- completions for lua runtime API

  -- snippets (have code structures boilerplates)
  use({ "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" }) --snippet engine
  use({ "rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617" }) -- a bunch of snippets to use

  -- LSP (features that all LP have like autocomplete, go to definition, declarations, implementations, warnings, errors, signatures... etc)
  use({ "neovim/nvim-lspconfig", commit = "148c99bd09b44cf3605151a06869f6b4d4c24455" }) -- enable LSP
  use({ "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" }) -- simple to use language server installer
  use({ "jose-elias-alvarez/null-ls.nvim", commit = "ff40739e5be6581899b43385997e39eecdbf9465" }) -- for formatters and linters

  -- telescope (find, filter, preview, pick faster)
  use({ "nvim-telescope/telescope.nvim", commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0" })

  -- treesitter (parser generator tool and an incremental parsing library. Have better syntax highlighting and other things...)
  use({ "nvim-treesitter/nvim-treesitter", commit = "5d11dfc27849e3d7435c32dbd8ea9be35bcd990b" })

  -- git integration for buffers
  use({ "lewis6991/gitsigns.nvim", commit = "c18e016864c92ecf9775abea1baaa161c28082c3" })


  -- automatically set up your configuration after cloning packer.nvim
  -- put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
