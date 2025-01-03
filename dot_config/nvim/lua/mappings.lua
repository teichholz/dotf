local function map(mode, lhs, rhs, opts, desc)
  local options = { noremap = true, silent = true, desc = desc }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

local opts = {}
map("n", "H", "^", opts, "Beginning of line")
map("n", "L", "g_", opts, "End of line")
map("n", "<C-q>", ":q!<CR>", opts, "Quit!")
map("v", "<", "<gv", opts, "Indent")
map("v", ">", ">gv", opts, "Indent")
map({ "n", "v" }, "<tab>", "%", opts, "Match pair")
map("n", "U", "<cmd>redo<cr>", opts, "Redo")
map("n", "<c-i>", "<c-i>", opts, nil)
map("n", "]b", "<cmd>bnext<cr>", opts, "Next buffer")
map("n", "[b", "<cmd>bprev<cr>", opts, "Previos buffer")

function OpenFileOrManPage()
  -- Get the word under the cursor (file or man page reference)
  local file_path = vim.fn.expand(vim.fn.expand('<cfile>'))

  if vim.fn.filereadable(file_path) == 1 then
    vim.cmd('edit ' .. file_path)
  else
    vim.cmd('Man ' .. file_path)
  end
end

map("n", "gf", OpenFileOrManPage, {}, nil)
