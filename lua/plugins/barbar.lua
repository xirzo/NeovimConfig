return {
    'romgrk/barbar.nvim',
    version = '^1.0.0',
    dependencies = {
        'lewis6991/gitsigns.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
        animation = true,
        clickable = true,
        highlight_visible = true,
        -- insert_at_start = true,
    },
}
