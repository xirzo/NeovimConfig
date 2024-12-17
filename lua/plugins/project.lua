return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  config = function()
    require("project_nvim").setup({
      silent_chdir = true, -- No message when changing dirs
      manual_mode = false, -- Auto-detect project root
    })
  end,
}
