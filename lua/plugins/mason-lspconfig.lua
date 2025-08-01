return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        automatic_enable = true,
        ensure_installed = { "clangd" },
    },
    dependencies = {
        {
            "mason-org/mason.nvim",
            opts = {},
        },

        {
            "neovim/nvim-lspconfig",
        }
    },
}

