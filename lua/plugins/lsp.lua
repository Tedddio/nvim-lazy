return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({})
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            vim.filetype.add({ extension = { templ = "templ" } })
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            require("mason-lspconfig").setup_handlers({
                function(server)
                    lspconfig[server].setup({
                        capabilities = capabilities,
                    })
                end,
            })

            vim.keymap.set("n", "gd", function()
                vim.lsp.buf.definition()
            end, {})
            vim.keymap.set("n", "K", function()
                vim.lsp.buf.hover()
            end, {})
            vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", {})   -- show definition, references
            vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {}) -- got to declaration
            vim.keymap.set("n", "<leader>rr", function()
                vim.lsp.buf.rename()
            end, {}) -- got to declaration
            vim.keymap.set("n", "<leader>ca", function()
                vim.lsp.buf.code_action()
            end, {}) -- got to declaration
            -- vim.keymap.set("n", "<leader>fr", function() vim.lsp.buf.references() end, opts) -- got to declaration

            -- diagnostics
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
            vim.keymap.set("n", "<leader>fd", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
            vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
        end,
    },
}
