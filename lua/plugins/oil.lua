return {
  "stevearc/oil.nvim",
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  opts = {
    view_options = {
      show_hidden = false,
    },
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-s>"] = "actions.select_vsplit",
      ["<C-h>"] = "actions.select_split",
      ["<C-t>"] = "actions.select_tab",
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = "actions.close",
      ["<C-l>"] = "actions.refresh",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = "actions.tcd",
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["g."] = "actions.toggle_hidden",

      ["l"] = "actions.select", -- Use 'l' to enter a directory or open a file
      ["h"] = "actions.parent", -- Use 'h' to go up to parent directory
    },
    float = {
      padding = 2,
      max_width = 80,
      max_height = 30,
      border = "rounded",
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        require("oil").open()
      end,
      desc = "Open oil.nvim file explorer",
    },
  },
}
