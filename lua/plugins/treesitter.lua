return {
  {
    "airblade/vim-rooter",
    event = "BufRead",
    config = function()
      -- vim.g.rooter_patterns = { ".git", "Makefile", "package.json", ".hg", ".svn" }
      vim.g.rooter_patterns = { ".git", "bin", "lib", "tests" }
      vim.g.rooter_silent_chdir = 1
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "c", "cpp", "python", "javascript", "html", "css", "rust" },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-refactor",
    event = "VeryLazy",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
      "ahmedkhalf/project.nvim",
    },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope git_files<CR>", desc = "Find Git Files" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help Tags" },
      { "<leader>fgp", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
    },
    opts = {
      defaults = {
        prompt_prefix = "🔍 ",
        selection_caret = " ",
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-n>"] = "move_selection_next",
            ["<C-p>"] = "move_selection_previous",
            ["<C-c>"] = "close",
          },
          n = {
            ["<C-n>"] = "move_selection_next",
            ["<C-p>"] = "move_selection_previous",
            ["<C-c>"] = "close",
          },
        },
      },
      pickers = {
        find_files = { hidden = true },
        git_files = { show_untracked = true },
        buffers = { sort_lastused = true, ignore_current_buffer = true },
        live_grep = { only_sort_text = true },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    },
    config = function(_, opts)
      local ok, telescope = pcall(require, "telescope")
      if ok then
        telescope.setup(opts)
        -- Check if the extensions table exists and contains the 'fzf' key
        if opts.extensions and opts.extensions.fzf then
          telescope.load_extension("fzf")
        end

        local project_ok = pcall(require, "project_nvim")
        if project_ok then
          telescope.load_extension("projects")
        end
      end

      local project_ok, project_nvim = pcall(require, "project_nvim")
      if project_ok then
        project_nvim.setup({
          silent_chdir = false,
          patterns = { ".git", "Makefile", "package.json", ".hg", ".svn" },
          exclude_dirs = { "~/.cache/*", "node_modules" },
          show_hidden = true,
        })
      end
    end,
  },
  -- {
  --   "ahmedkhalf/project.nvim",
  --   lazy = true,
  --   config = function()
  --     require("project_nvim").setup({
  --       detection_methods = { "pattern", "lsp" },
  --       patterns = { ".git", "Makefile", "package.json", ".hg", ".svn" },
  --       exclude_dirs = { "~/.cache/*", "node_modules" },
  --       show_hidden = true,
  --     })
  --   end,
  -- },
  {
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
  },
}
