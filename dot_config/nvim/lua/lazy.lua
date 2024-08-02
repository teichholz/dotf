local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

require("lazy").setup({
  -- Basic configuration
  { 'echasnovski/mini.basics', version = false, opts = {
    mappings = { windows = true }
  }},
  -- Columnar file viewer
  { 'echasnovski/mini.files', version = false },
  -- Move visual blocks
  { 'echasnovski/mini.move', version = false },
  -- Auto pair
  { 'echasnovski/mini.pairs', version = false },
  -- Surround plugin
  { 'echasnovski/mini.surround', version = false },
  -- Fuzzy Finder for different things
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  -- Split / join arguments to functions
  { 'echasnovski/mini.splitjoin', version = false },
  -- atom colorscheme
  { 'rakr/vim-one' }
})
