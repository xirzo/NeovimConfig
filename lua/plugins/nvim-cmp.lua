return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",

        dependencies = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },

        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    -- ["<Tab>"] = cmp.mapping(function(fallback)
                    --   if cmp.visible() then
                    --     cmp.select_next_item()
                    --   elseif luasnip.expand_or_jumpable() then
                    --     luasnip.expand_or_jump()
                    --   else
                    --     fallback()
                    --   end
                    -- end, { "i", "s" }),
                    -- ["<S-Tab>"] = cmp.mapping(function(fallback)
                    --   if cmp.visible() then
                    --     cmp.select_prev_item()
                    --   elseif luasnip.jumpable(-1) then
                    --     luasnip.jump(-1)
                    --   else
                    --     fallback()
                    --   end
                    -- end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "luasnip" },
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                }),
            })
        end,
    },
}
