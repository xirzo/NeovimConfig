return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "right",
    },
  },
  keys = {
    { "<leader>e", false },
    { "<leader>fe", "<cmd>Neotree toggle<cr>", desc = "Explorer NeoTree" },
  },
}
