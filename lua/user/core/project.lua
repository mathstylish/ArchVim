local ok, project = pcall(require, "project_nvim")
if not ok then
  return
end

local config = {
  -- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
  detection_methods = { "pattern" },
  -- patterns used to detect root dir, when **"pattern"**, is in detection_methods
  patterns = { ".git", "Makefile", "package.json" },
}

project.setup(config)

local telescope_ok,  telescope = pcall(require, "telescope")
if not telescope_ok then
  return
end

telescope.load_extension("projects")