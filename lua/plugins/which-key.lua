return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "left",
    },
    delay = 100,
  },
  config = function(_, opts)
    require("which-key").setup(opts)

    require("which-key").add({
      { "<leader>1", desc = "Buffer 1" },
      { "<leader>2", desc = "Buffer 2" },
      { "<leader>3", desc = "Buffer 3" },
      { "<leader>4", desc = "Buffer 4" },
      { "<leader>5", desc = "Buffer 5" },
      { "<leader>6", desc = "Buffer 6" },
      { "<leader>7", desc = "Buffer 7" },
      { "<leader>8", desc = "Buffer 8" },
      { "<leader>9", desc = "Buffer 9" },
      { "<leader>0", desc = "Buffer 10" },
      { "<leader><Space>", desc = "Clear search highlight" },
      { "<leader>y", desc = "Yank to clipboard" },
      { "<leader>Y", desc = "Yank line to clipboard" },
      { "<leader>p", desc = "Paste from clipboard" },
      { "<leader>P", desc = "Paste before cursor" },
      { "<leader>e", desc = "Open oil file explorer" },
      { "<leader>f", desc = "Format buffer (LSP)" },
      { "<leader>ff", desc = "Find files" },
      { "<leader>/", desc = "Live grep" },
      { "<leader>rn", desc = "Rename symbol" },
      { "<leader>ca", desc = "Code action" },
      { "<leader>c", desc = "Code", icon = "󰆧" },
      { "<leader>r", desc = "Refactor" },
      { "<leader>j", desc = "Joplin", icon = "󰿱" },
      { "<leader>jt", desc = "Tree browser" },
      { "<leader>js", desc = "Find note" },
      { "<leader>jsnb", desc = "Find notebook" },
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer local keymaps",
      },
    })
  end,
}