local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd(
  "BufWritePost",
  { command = "source <afile> | PackerCompile", group = packer_group, pattern = "plugins.lua" }
)

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end
vim.api.nvim_command("packadd packer.nvim")


return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'L3MON4D3/LuaSnip'

  use 'tommcdo/vim-exchange'

  use {
    "windwp/nvim-autopairs"
  }

  -- use "machakann/vim-sandwich"
  
  use "mg979/vim-visual-multi"

  use "tpope/vim-sensible"
  use "ggandor/leap.nvim"
  
  use {
    "numToStr/Comment.nvim",
    config = function()
      require "Comment".setup()
    end
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- use({ "neovim/nvim-lspconfig" })
  -- use({"williamboman/mason.nvim", 
  --   conifg = function()
  --     require("mason").setup()
  --   end})

  use({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end
  })

  -- Emmet
  use "mattn/emmet-vim"
  -- use "windwp/nvim-ts-autotag"
  use "junegunn/vim-easy-align"

  use "rakr/vim-one"

  -- Private plugins
  use "/home/tim/git/dired.nvim"



  if packer_bootstrap then
    require('packer').sync()
  end
end)
