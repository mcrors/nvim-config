local config =
{
    controls = {
        element = "repl",
        enabled = true
    },
    layouts = {
        {
            position = "left", size = 60,
            elements = {
                { id = "watches", size = 0.4 },
                { id = "breakpoints", size = 0.4 },
            },
        },
        {
            position = "bottom", size = 15,
            elements = {
                { id = "scopes", size = 1.0 },
            },
        },
        {
            position = "right", size = 60,
            elements = {
                { id = "repl", size = 0.8},
            }
        }
    }
}


require('dapui').setup(config)

local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require("nvim-dap-virtual-text").setup()
