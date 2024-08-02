local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true, }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

local opts = { noremap=true, silent=true }


map("n", "H", "^", opts)
map("n", "L", "g_", opts)
map("n", "<C-q>", ":q!<CR>", opts)
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("n", "<tab>", "%", opts)
map("v", "<tab>", "%", opts)
map("n", "U", "<cmd>redo<cr>", opts)
map("n", "<C-I>", "<C-I>", opts)
