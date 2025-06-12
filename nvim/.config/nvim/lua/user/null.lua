-- plugins/null-ls.lua or wherever you keep your LSP stuff
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- Prettier for HTML, CSS, SCSS, TS
        null_ls.builtins.formatting.prettier.with({
            filetypes = { "html", "css", "scss", "typescript", "typescriptreact" }
        }),
        -- Optional: ESLint fix (if you want this too)
        -- null_ls.builtins.diagnostics.eslint,
        -- null_ls.builtins.code_actions.eslint,
        -- null_ls.builtins.formatting.eslint,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            -- Create the group first!
            local augroup = vim.api.nvim_create_augroup("Format", { clear = true })

            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end
})
