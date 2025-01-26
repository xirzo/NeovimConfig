local function detect_build_system()
  if vim.fn.filereadable("Makefile") == 1 or vim.fn.filereadable("makefile") == 1 then
    return "make"
  elseif vim.fn.filereadable("CMakeLists.txt") == 1 then
    return "cmake"
  elseif vim.fn.filereadable("Cargo.toml") == 1 then
    return "cargo"
  elseif vim.fn.filereadable("package.json") == 1 then
    return "npm"
  else
    return nil
  end
end

local build_commands = {
  make = "make",
  cargo = "cargo build",
  npm = "npm run build",
}

local function build_project()
  local build_system = detect_build_system()
  if not build_system then
    vim.notify("No build system detected!", vim.log.levels.ERROR)
    return
  end

  if build_system == "cmake" then
    local cmake = require("cmake-tools")
    if cmake.is_cmake_project() then
      vim.notify("Building CMake project...", vim.log.levels.INFO)
      cmake.build({}, function(success)
        if success then
          vim.notify("CMake build succeeded!", vim.log.levels.INFO)
        else
          vim.notify("CMake build failed!", vim.log.levels.ERROR)
        end
      end)
    else
      vim.notify("Not a CMake project!", vim.log.levels.ERROR)
    end
    return
  end

  local command = build_commands[build_system]
  if not command then
    vim.notify("Unsupported build system: " .. build_system, vim.log.levels.ERROR)
    return
  end

  vim.notify("Building project with " .. build_system .. "...", vim.log.levels.INFO)
  vim.fn.termopen(command, {
    cwd = vim.fn.getcwd(),
    on_exit = function(_, exit_code)
      if exit_code == 0 then
        vim.notify("Build succeeded!", vim.log.levels.INFO)
      else
        vim.notify("Build failed with exit code " .. exit_code, vim.log.levels.ERROR)
      end
    end,
  })
end

vim.api.nvim_create_user_command("BuildProject", build_project, { desc = "Build the current project" })
