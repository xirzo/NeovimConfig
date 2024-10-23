return {
  "Civitasv/cmake-tools.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  config = function()
    require("cmake-tools").setup({
      -- lua/plugins/cmake-tools.lua
      cmake_command = "cmake", -- Default CMake command
      build_dir = "build", -- Directory where build files are generated
      build_type = "Debug", -- Build type
      on_build_finished = function()
        -- Optional callback after build finishes
      end,
    })
  end,
}
