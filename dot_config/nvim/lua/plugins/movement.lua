return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      modes = {
        search = {
          enabled = true
        },
      }
    },
    config = true,
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S",     mode = { "n" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end,     desc = "Toggle Flash Search" }
    },
  },
  {
    "cbochs/grapple.nvim",
    opts = {
      scope = "git_branch",
    },
    event = { "BufReadPost", "BufNewFile" },
    cmd = "Grapple",
    keys = {
      { "<leader>m", "<cmd>Grapple toggle<cr>",          desc = "Grapple toggle tag" },
      { "<leader>M", "<cmd>Grapple toggle_tags<cr>",     desc = "Grapple open tags window" },
      { "<C-n>",     "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
      { "<C-p>",     "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
    },
  },
  {
    "rgroli/other.nvim",
    lazy = false,
    opts = {
      mappings = {
        {
          pattern = "/(.*)/movement.lua",
          target = "/%1/ai.lua",
          context = "test"
        },
        {
          pattern = "/(.*)/ai.lua",
          target = "/%1/movement.lua",
          context = "test"
        },
        -- {
        --   pattern = "View",
        --   target = "",
        --   context = "Ctrl"
        -- },
        -- {
        --   pattern = "View",
        --   target = "",
        --   context = "CtrLib"
        -- },
        -- {
        --   pattern = "ViewLib",
        --   target = "",
        --   context = "CtrLib"
        -- },
        -- {
        --   pattern = "CtrlLib",
        --   target = "",
        --   context = "ViewLib"
        -- },
        -- {
        --   pattern = "Ctrl",
        --   target = "",
        --   context = "View"
        -- },
      },
    },
    keys = {
      { "#", "<cmd>Other<cr>", desc = "Other File" }
    },
    config = function(_, opts)
      require('other-nvim').setup(opts)
    end
  }
}
