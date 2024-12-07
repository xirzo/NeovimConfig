return {
  "Civitasv/cmake-tools.nvim",
  ft = { "cpp", "c", "h", "hpp" },
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    require("cmake-tools").setup({
      cmake_command = "cmake",
      build_dir = "build",
      build_type = "Debug",
      on_config_done = function()
        if pcall(require, "telescope") then
          require("cmake-tools").register_telescope_functions()
        end
      end,
    })
  end,
}
