local options = {
  shiftwidth = 2,
  smarttab = true,
  tabstop = 2,
  softtabstop = 2,
  expandtab = true,

  completeopt = { "menu", "menuone", "preview", "noinsert" },

  -- relative line numbers
  number = true,
  relativenumber = true,

  -- clipboard
  clipboard = "unnamed",

  -- no swapfiles
  swapfile = false,
  undofile = true,

  -- smart search
  smartcase = true,

  -- theme
  termguicolors = true,
  --background = "dark",

  -- mouse
  mouse = "a",

  -- no cursor line
  cursorline = false,

  -- project local lua configuration
  exrc = true,
  secure = true,

  foldexpr = 'v:lua.vim.treesitter.foldexpr()',
  foldmethod = 'expr',
  foldcolumn = '1',
  foldlevel = 99,
  foldlevelstart = 99
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- custom
vim.g.autoformat = true

vim.cmd("colorscheme tokyonight")
