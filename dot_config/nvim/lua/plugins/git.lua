return {
  {
    "sindrets/diffview.nvim",
    config = true,
    opts = {
      use_icons = false
    }
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      -- Only one of these is needed.
      -- "nvim-telescope/telescope.nvim", -- optional
      -- "ibhagwan/fzf-lua",              -- optional
      "echasnovski/mini.pick", -- optional
    },
    config = true
  },
}
