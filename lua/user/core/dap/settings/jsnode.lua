local M = {}

M.debugger = "jsnode"

M.config = function(installation_path)
  return {
    adapters = {
      type = "executable",
      command = "node",
      args = {
        installation_path .. "jsnode/vscode-node-debug2/out/src/nodeDebug.js"
      }
    },
    configurations = {
      {
        type = "node2",
        request = "launch",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal"
      }
    }
  }
end

return M
