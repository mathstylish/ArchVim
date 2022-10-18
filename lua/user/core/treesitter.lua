local treesitter_ok, treesitter = pcall(require, "nvim-treesitter")
if not treesitter_ok then
  return
end

local configs_ok, configs = pcall(require, "nvim-treesitter.configs")
if not configs_ok then
  return
end

local config = {
  ensure_installed = {
    "lua",
    "bash",
    "markdown",
    "markdown_inline"
  },

  ignore_install = { },
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

  highlight = {
    enable = true, -- false will disable thw whole extensions
    disable = { "css" } -- list of language that will be disabled
  },

  autopairs = {
    enable = true
  },

  indent = {
    enable = true, disable = { "python", "css" }
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false
  }
}

configs.setup(config)