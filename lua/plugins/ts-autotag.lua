return {
  "tronikelis/ts-autotag.nvim",
  event = "VeryLazy",
  opts = {
    opening_node_types = {
      "tag_start",
      "STag",
      "start_tag",
      "jsx_opening_element",
    },
    identifier_node_types = {
      "tag_name",
      "erroneous_end_tag_name",
      "Name",
      "member_expression",
      "identifier",
      "element_identifier",
    },
    disable_in_macro = true,
    filetypes = {
      "typescript",
      "javascript",
      "typescriptreact",
      "javascriptreact",
      "xml",
      "html",
      "templ",
    },
    auto_close = {
      enabled = true,
    },
    auto_rename = {
      enabled = true,
      closing_node_types = {
        "jsx_closing_element",
        "tsx_closing_element",
        "ETag",
        "end_tag",
        "erroneous_end_tag",
        "tag_end",
      },
    },
  },
}