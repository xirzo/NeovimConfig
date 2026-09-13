local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Clear search highlight
map("n", "<leader><Space>", function()
  vim.cmd.nohlsearch()
  vim.fn.setreg("/", "")
end, opts)

-- Clipboard (system clipboard with feedback via unnamedplus too)
map("n", "<leader>y", '"+y', opts)
map("x", "<leader>y", '"+y', opts)
map("n", "<leader>Y", '"+Y', opts)
map("x", "<leader>Y", '"+Y', opts)
map("n", "<leader>p", '"+p', opts)
map("x", "<leader>p", '"+p', opts)
map("n", "<leader>P", '"+P', opts)
map("x", "<leader>P", '"+P', opts)

-- Soft-wrap aware movement
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)

-- Wrap a visual selection in brackets / quotes
map("x", "(", "<esc>`>a)<esc>`<i(<esc>", opts)
map("x", "{", "<esc>`>a}<esc>`<i{<esc>", opts)
map("x", "[", "<esc>`>a]<esc>`<i[<esc>", opts)
map("x", '"', "<esc>`>a\"<esc>`<i\"<esc>", opts)
map("x", "'", "<esc>`>a'<esc>`<i'<esc>", opts)

-- Buffer navigation (barbar)
map("n", "<Tab>", "<cmd>BufferNext<CR>", opts)
map("n", "<S-Tab>", "<cmd>BufferPrevious<CR>", opts)
map("n", "<S-q>", "<cmd>BufferClose<CR>", opts)

-- Close current buffer, falling back to a scratch buffer if it's the last one
map("n", "Q", function()
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })
  if #bufs <= 1 then
    vim.cmd("enew")
  else
    vim.cmd("BufferClose")
  end
end, opts)

-- Buffer jumps 1..10
for i = 1, 9 do
  map("n", "<leader>" .. i, "<cmd>BufferGoto " .. i .. "<CR>", opts)
end
map("n", "<leader>0", "<cmd>BufferGoto 10<CR>", opts)

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Terminal mode
map("t", "<Esc>", "<C-\\><C-n>", opts)
map("t", "<C-q>", "<C-\\><C-n>:q<CR>", opts)

-- Finders (Telescope)
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>/", "<cmd>Telescope live_grep<CR>", opts)

-- Live grep with optional query argument
vim.api.nvim_create_user_command("Rg", function(cmd)
  require("telescope.builtin").live_grep({ default_text = cmd.args })
end, { nargs = "?", bang = true })

-- Write
vim.api.nvim_create_user_command("W", "write", {})

-- Move lines / blocks (move.nvim)
map("n", "<M-k>", ":MoveLine(-1)<CR>", opts)
map("n", "<M-j>", ":MoveLine(1)<CR>", opts)
map("v", "<M-k>", ":MoveBlock(-1)<CR>", opts)
map("v", "<M-j>", ":MoveBlock(1)<CR>", opts)

-- Compile mode (compile-mode.nvim)
map("n", "<S-z>", ":Compile<CR>", opts)
map("n", "<C-z>", ":Recompile<CR>", opts)

-- Dispatch (vim-dispatch)
map("n", "<F5>", ":Make<CR>", opts)
map("n", "<F6>", ":Dispatch<CR>", opts)
map("n", "<F7>", ":Copen<CR>", opts)

-- Inspect syntax highlighting stack at cursor
local function synstack()
  local line = vim.fn.line(".")
  local col = vim.fn.col(".")
  for _, id in ipairs(vim.fn.synstack(line, col)) do
    local name = vim.fn.synIDattr(vim.fn.synIDtrans(id), "name")
    if name ~= "" then
      vim.notify(name)
    end
  end
end
map("n", "<F3>", synstack, opts)