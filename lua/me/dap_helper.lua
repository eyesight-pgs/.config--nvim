local dap = require'dap'

local function attach()
  print("attaching.....");
  dap.run({
    type = "my_node_js",
    request = "attach",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    skipFiles = {'<node_internals>/**/*.js'},
  })
end

return {
  attach = attach,
}

