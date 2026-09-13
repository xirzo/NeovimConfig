return {
  "fedepujol/move.nvim",
  keys = {
    { "<M-k>", desc = "Move selection/line up" },
    { "<M-j>", desc = "Move selection/line down" },
  },
  config = function()
    require("move").setup({
      line = { enable = true, indent = true },
      block = { enable = true, indent = true },
      word = { enable = true },
      char = { enable = false },
    })
  end,
}