local dap = require("dap")
local dap_python = require("dap-python")
local dap_ui = require("dapui")

-- Path to the python installation which contains the debugpy module
local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"

-- Setup debugging for Python
dap_python.setup(path)

-- Setup UI (start automatically when nvim-dap starts)
dap_ui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function() dap_ui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dap_ui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dap_ui.close() end

-- Mappings
vim.keymap.set('n', '<leader>db', function() vim.cmd("DapToggleBreakpoint") end)
vim.keymap.set('n', '<leader>dpr', function() dap_python.test_method()  end)  -- Python
