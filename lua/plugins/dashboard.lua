return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      formats = {
        key = function(item)
          return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
        end,
      },
      sections = {
        { section = "terminal", cmd = "fortune -s | cowsay", hl = "header", padding = 1, indent = 8 },
        { title = "MRU", padding = 1 },
        { section = "recent_files", limit = 8, padding = 1 },
        -- { title = "MRU ", file = vim.fn.fnamemodify(".", ":~"), padding = 1 },
        -- { section = "recent_files", cwd = true, limit = 8, padding = 1 },
        { title = "Sessions", padding = 1 },
        { section = "projects", padding = 1 },
        { title = "Bookmarks", padding = 1 },
        { section = "keys" },
      },
    },
  },
}
