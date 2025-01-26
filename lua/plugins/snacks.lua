return {
  "folke/snacks.nvim",
  opts = {
    notifier = {
      enabled = false,
      timeout = 3000,
    },
    dashboard = {
      formats = {
        key = function(item)
          return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
        end,
      },
      sections = {
        { title = "MRU", padding = 1 },
        { section = "recent_files", limit = 8, padding = 1 },
        { title = "Sessions", padding = 1 },
        { section = "projects", padding = 1 },
        { title = "Bookmarks", padding = 1 },
        { section = "keys" },
      },
    },
  },
}
