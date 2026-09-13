return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({})
    vim.schedule(function()
      pcall(vim.cmd, "TSInstall c cpp go odin python lua vim vimdoc html javascript typescript markdown markdown_inline")
    end)
  end,
}