local options = {
  shiftwidth = 2,
  smarttab = true,
  tabstop = 2,
  softtabstop = 2,
  expandtab = true,

  completeopt = { "menu,menuone,noselect" },

  -- relative line numbers
  number = true,
  relativenumber = true,

  -- clipboard
  clipboard = "unnamedplus",

  sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" },

  grepprg = "rg --vimgrep",

  autowrite = true,

  -- no swapfiles
  swapfile = false,
  undofile = true,

  -- smart search
  smartcase = true,

  smoothscroll = true,

  -- theme
  termguicolors = true,
  --background = "dark",

  -- mouse
  mouse = "a",

  virtualedit = "block",

  -- no cursor line
  cursorline = false,

  laststatus = 3,

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
vim.g.breadcrumbs = false

vim.cmd("colorscheme tokyonight")

vim.diagnostic.config({
  virtual_text = true
})
