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
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd("colorscheme tokyonight")
