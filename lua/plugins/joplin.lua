return {
  "happyeric77/joplin.nvim",
  cmd = { "JoplinTree", "JoplinFind", "JoplinFindNotebook", "JoplinBrowse", "JoplinPing", "JoplinHelp" },
  keys = {
    { "<leader>jt", "<cmd>JoplinTree<CR>", desc = "Joplin: tree browser" },
    { "<leader>js", "<cmd>JoplinFind<CR>", desc = "Joplin: find note" },
    { "<leader>jsnb", "<cmd>JoplinFindNotebook<CR>", desc = "Joplin: find notebook" },
  },
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    keymaps = {
      search = "<leader>js",
      search_notebook = "<leader>jsnb",
      toggle_tree = "<leader>jt",
    },
  },
}