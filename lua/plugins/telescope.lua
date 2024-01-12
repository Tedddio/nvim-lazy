return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffer" })
            vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
            vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Find references" })
            vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search Grep" })
            vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search Word" })
            vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({
                            -- even more opts
                        }),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
