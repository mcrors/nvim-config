-- required for rest nvim
package.cpath = package.cpath .. ";/opt/homebrew/lib/lua/5.4/?.so;;"
package.path = package.path .. ";/opt/homebrew/share/lua/5.4/?.lua;;"
vim.bo.formatexpr = ""
vim.bo.formatprg = "jq"

vim.g.rest_nvim = {
    custom_dynamic_variables = {
        START_TIME = function()
            local now_ms = math.floor(os.time() * 1000)
            return tostring(now_ms - 3600000)    -- now - 1 hour in ms
        end,
        END_TIME = function()
            local now_ms = math.floor(os.time() * 1000)
            return tostring(now_ms)              -- now in ms
        end,
    },
    request = {
        skip_ssl_verification = true, -- this is the only change from the default
        hooks = {
            encode_url = true,
            user_agent = "rest.nvim v" .. require("rest-nvim.api").VERSION,
            set_content_type = true,
        },
    },
    response = {
        hooks = {
            decode_url = true,
            format = true,
        },
    },
    clients = {
        curl = {
            statistics = {
                { id = "time_total", winbar = "take", title = "Time taken" },
                { id = "size_download", winbar = "size", title = "Download size" },
            },
            opts = {
                set_compressed = false,
                certificates = {},
            },
        },
    },
    cookies = {
        enable = true,
        path = vim.fs.joinpath(vim.fn.stdpath("data"), "rest-nvim.cookies"),
    },
    env = {
        enable = true,
        pattern = ".*%.env.*",
        find = function()
            local config = require("rest-nvim.config")
            return vim.fs.find(function(name, _)
                return name:match(config.env.pattern)
            end, {
                path = vim.fn.getcwd(),
                type = "file",
                limit = math.huge,
            })
        end,
    },
    ui = {
        winbar = true,
        keybinds = {
            prev = "H",
            next = "L",
        },
    },
    highlight = {
        enable = true,
        timeout = 750,
    },
    _log_level = vim.log.levels.WARN,
}
