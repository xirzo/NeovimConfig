return {
  {
    "L3MON4D3/LuaSnip",
    event = "VeryLazy",
    version = "2.*", -- or a specific version
    build = "make install_jsregexp", -- ensures LuaSnip dependencies are installed
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = {
      history = true,
      updateevents = "TextChanged,TextChangedI",
    },
    config = function(_, opts)
      local luasnip = require("luasnip")
      luasnip.config.set_config(opts)
      require("luasnip.loaders.from_vscode").lazy_load({ "~/.config/nvim/snippets" })
    end,
  },
}
