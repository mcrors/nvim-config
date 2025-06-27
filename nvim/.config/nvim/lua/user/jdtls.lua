-- setup jdtls to be as close to vscode as possible
-- I want to auto import missing imports on save
-- I want to be able to run tests from within nvim
-- I want to be able to debug from within nvim
-- I want to be able to format on save
-- I want to be able to rename variables and have it update all references
-- I want to be able to see documentation on hover
-- I want to be able to see method signatures on hover
-- I want to be able to see type information on hover
-- I want to be able to see errors and warnings as I type
local M = {}

M.setup = function()
    local jdtls = require("jdtls")
    local jdtls_config = require("user.lsp.settings.jdtls")

    jdtls.start_or_attach({
        cmd = { "jdtls" },
        root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
        settings = jdtls_config,
    })
end

return M


