
local nnoremap = require("me.keymap").nnoremap
local dap = require("dap")
dap.set_log_level('TRACE')
-- require('dap.ext.vscode').json_decode = require'json5'.parse -- NOT WORKING

-- -- this works but not the good solution
-- adapters
-- require("dap-vscode-js").setup({
--   -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
--   -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
--   -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
--   adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
--   -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
--   -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
--   -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
-- })
-- -- configure
-- for _, language in ipairs({ "typescript", "javascript" }) do
--   require("dap").configurations[language] = {
--   {
--     type = "pwa-node",
--     request = "launch",
--     name = "Launch file",
--     program = "${file}",
--     cwd = "${workspaceFolder}",
--   },
--   {
--     type = "pwa-node",
--     request = "attach",
--     name = "Attach",
--     processId = require'dap.utils'.pick_process,
--     cwd = "${workspaceFolder}",
--   }
-- }
-- end




-- NODE / TYPESCRIPT
-- adapter
dap.adapters.my_node_js = {
  type = 'executable'; -- executable | server
  command = 'node',
  args = { vim.fn.stdpath "data" .. '/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' };
}
-- configure
dap.configurations.typescript = {
  {
    name = "Attach by Process ID",
    -- processId = "${command:PickProcess}",
    processId = require'dap.utils'.pick_process,
    request = "attach",
    skipFiles = {
      "<node_internals>/**"
    },
    type = "my_node_js",
    outFiles = {
      "${workspaceFolder}/dist/**/*.js"
    },
  }
}



-- PHP
-- adapter
dap.adapters.my_php_adapter = {
  type = 'executable',
  command = '$HOME/.local/share/nvim/mason/packages/php-debug-adapter/php-debug-adapter',
}
-- configure
dap.configurations.php = {
  {
    type = 'my_php_adapter',
    request = 'launch',
    name = 'waiting for Xdebug to ping me',
    port = 9003
  }
}


-- C / C++ / Rust
dap.adapters.cppdbg= {
  id = 'cppdbg',
  type = 'executable',
  command = '$HOME/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}
dap.configurations.cpp = {
  {
    name = "cpp: launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description =  'enable pretty printing',
        ignoreFailures = false
      },
    },
  },
  {
    name = 'cpp: attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description =  'enable pretty printing',
        ignoreFailures = false
      },
    },
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp



-- DAP UI
require("dapui").setup({
  icons = { expanded = "", collapsed = "", current_frame = "" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Use this to override mappings for specific elements
  element_mappings = {
    -- Example:
    -- stacks = {
    --   open = "<CR>",
    --   expand = "o",
    -- }
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7") == 1,
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = true,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "",
      terminate = "",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})
-- dap ui end


-- DAP VIRTUAL TEXT
-- dap virtual text 
require("nvim-dap-virtual-text").setup {
  enabled = true,                        -- enable this plugin (the default)
  enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
  highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
  highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
  show_stop_reason = true,               -- show stop reason when stopped for exceptions
  commented = false,                     -- prefix virtual text with comment string
  only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
  all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
  filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
  -- experimental features:
  virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
  all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
  virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
  virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
  -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}
-- dap virtual text end





