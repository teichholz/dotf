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
  -- cursor line

  cursorline = true,

-- theme
  termguicolors = true,
  --background = "dark",

-- mouse 
  mouse = "a",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- local handle = io.popen('defaults read -g AppleInterfaceStyle 2>/dev/null')
-- local result = handle:read("*a")
-- handle:close()
-- if string.gsub(result, "%s+", "") == 'Dark' then
--   vim.cmd("set background=dark")
-- else
--   vim.cmd("set background=light")
-- end
-- vim.cmd("hi Normal ctermbg=none guibg=none")
