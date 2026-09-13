return {
  'chomosuke/typst-preview.nvim',
  lazy = false, -- or ft = 'typst'
  version = '1.*',
  opts = {},
  config = function()
    require 'typst-preview'.setup {
      -- Setting this true will enable logging debug information to
      -- `vim.fn.stdpath 'data' .. '/typst-preview/log.txt'`
      debug = false,

      -- Custom format string to open the output link provided with %s
      -- Example: open_cmd = 'firefox %s -P typst-preview --class typst-preview'
      open_cmd = nil,

      -- Custom port to open the preview server. Default is random.
      -- Example: port = 8000
      port = 0,

      -- Custom host to bind the preview server to.
      -- Note that '0.0.0.0' is not supported and [won't be](https://github.com/Myriad-Dreamin/tinymist/issues/2105)
      -- Example: host = '192.168.0.10'
      host = '127.0.0.1',

      -- Setting this to 'always' will invert black and white in the preview
      -- Setting this to 'auto' will invert depending if the browser has enable
      -- dark mode
      -- Setting this to '{"rest": "<option>","image": "<option>"}' will apply
      -- your choice of color inversion to images and everything else
      -- separately.
      invert_colors = 'never',

      -- Only render the visible portion of the document.
      -- Improves performance significantly for large documents.
      -- Disable if you experience rendering issues.
      partial_rendering = true,

      -- Whether the preview will follow the cursor in the source file
      follow_cursor = true,

      -- Provide the path to binaries for dependencies.
      -- Setting this will skip the download of the binary by the plugin.
      -- Warning: Be aware that your version might be older than the one
      -- required.
      dependencies_bin = {
        tinymist = nil,
        websocat = nil
      },

      -- A list of extra arguments (or nil) to be passed to previewer.
      -- For example, extra_args = { "--input=ver=draft", "--ignore-system-fonts" }
      extra_args = nil,

      -- This function will be called to determine the root of the typst project
      get_root = function(path_of_main_file)
        local root = os.getenv 'TYPST_ROOT'
        if root then
          return root
        end

        -- Look for a project marker so imports from parent dirs stay inside root
        local main_dir = vim.fs.dirname(vim.fn.fnamemodify(path_of_main_file, ':p'))
        local found = vim.fs.find({ 'typst.toml', '.git' }, { path = main_dir, upward = true })
        if #found > 0 then
          return vim.fs.dirname(found[1])
        end

        return main_dir
      end,

      -- This function will be called to determine the main file of the typst
      -- project.
      get_main_file = function(path_of_buffer)
        return path_of_buffer
      end,
    }
  end,
}
