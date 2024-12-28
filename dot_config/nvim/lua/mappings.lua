local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true, }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

local opts = { noremap = true, silent = true }
map("n", "H", "^", opts)
map("n", "L", "g_", opts)
map("n", "<C-q>", ":q!<CR>", opts)
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("n", "<tab>", "%", opts)
map("v", "<tab>", "%", opts)
map("n", "U", "<cmd>redo<cr>", opts)
map("n", "<c-i>", "<c-i>", opts)

function OpenFileOrManPage()
  -- Get the word under the cursor (file or man page reference)
  local file_path = vim.fn.expand(vim.fn.expand('<cfile>'))

  if vim.fn.filereadable(file_path) == 1 then
    vim.cmd('edit ' .. file_path)
  else
    vim.cmd('Man ' .. file_path)
  end
end

map("n", "gf", OpenFileOrManPage, { noremap = true })
