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
  config = function()
      require("joplin").setup({
            token_env = "016b34ce388942e207c41afc8b0850f514bdb5b693f84e8dba3ef43c704bdaf56d186cde932d28406cec1fc96e89d454482730265926e7e3adca56a7c310a78e"
      })
  end,
}
