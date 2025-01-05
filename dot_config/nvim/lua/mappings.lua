local function map(mode, lhs, rhs, opts, desc)
  local options = { noremap = true, silent = true, desc = desc }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

function Quit()
  local buffers = vim.fn.getbufinfo({ buflisted = 1 })
  if #buffers > 1 then
    vim.cmd("bdelete")
  else
    vim.cmd("q!")
  end
end

function OpenFileOrManPage()
  -- Get the word under the cursor (file or man page reference)
  local file_path = vim.fn.expand(vim.fn.expand('<cfile>'))

  if vim.fn.filereadable(file_path) == 1 then
    vim.cmd('edit ' .. file_path)
  else
    vim.cmd('Man ' .. file_path)
  end
end

local opts = {}
map("n", "<C-q>", Quit, opts, "Quit")
map("n", "<c-i>", "<c-i>", opts, nil)
map("n", "H", "^", opts, "Beginning of line")
map("n", "L", "g_", opts, "End of line")
map("n", "U", "<cmd>redo<cr>", opts, "Redo")
map("n", "[b", "<cmd>bprev<cr>", opts, "Previos tab")
map("n", "[t", "<cmd>tabprev<cr>", opts, "Next tab")
map("n", "]b", "<cmd>bnext<cr>", opts, "Next buffer")
map("n", "]t", "<cmd>tabnext<cr>", opts, "Next tab")
map("n", "gf", OpenFileOrManPage, {}, nil)
map("v", "<", "<gv", opts, "Indent")
map("v", ">", ">gv", opts, "Indent")
map({ "n", "v" }, "<tab>", "%", opts, "Match pair")
