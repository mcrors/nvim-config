local servers = {"lua_ls", "pyright", "gopls", "jdtls", "jsonls"}

local capabilities = require("user.lsp.handlers").capabilities
local on_attach = require("user.lsp.handlers").on_attach

for _, server in pairs(servers) do
    local dir = "user.lsp.settings." .. server
    local ok, settings = pcall(require, dir)
    if not ok then
        settings = {}
    end
    vim.lsp.config(server, {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = settings,
    })
end

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers,
})
