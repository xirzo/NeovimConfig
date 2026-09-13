vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "objc" },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
    vim.bo.cindent = true
    vim.bo.formatprg = "clang-format -style=file"
    vim.bo.equalprg = "clang-format -style=file"
    vim.bo.makeprg = "gcc -o %:p:r %:p -std=c99 -W -Wall"
    vim.bo.errorformat = "%f:%l:%c: %m,%f:%l: %m"
    vim.keymap.set("n", "<F6>", ":!clear; %:p:r<CR>", { buffer = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.bo.makeprg = "go build ."
    vim.bo.errorformat = "%f:%l:%c: %m,%f:%l: %m"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "odin",
  callback = function()
    vim.bo.makeprg = "odin build ."
    vim.bo.errorformat = "%f(%l:%c) %m"
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local mode = vim.api.nvim_get_mode().mode
    local filetype = vim.bo.filetype
    if vim.bo.modified and mode == "n" and filetype ~= "oil" then
      vim.lsp.buf.format()
    end
  end,
})