return {
  {
    "L3MON4D3/LuaSnip",
    event = "VeryLazy",
    version = "2.*",
    build = "make install_jsregexp",

    opts = {
      history = true,
      updateevents = "TextChanged,TextChangedI",
    },

    config = function(_, opts)
      local luasnip = require("luasnip")

      luasnip.config.set_config(opts)
      require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } })
    end,
  },
}
