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
    opts = {
      mappings = {
        {
          pattern = "/Source/icClient/html/(.*).html",
          target  = "/Source/icClient/js/ngController/%1Ctrl.js",
          context = "View->Ctrl"
        },
        {
          pattern = "/Source/icClient/html/(.*).html",
          target = "/lib/client-lib/js/ngController/%1Ctrl.js",
          context = "View->Ctrl"
        },
        {
          pattern = "/home/tim/git/storm/icClientLib/html/(.*).html",
          target = "/home/tim/git/storm/icClientLib/js/ngController/%1Ctrl.js",
          context = "View->Ctrl"
        },
        {
          pattern = "/home/tim/git/storm/icClientLib/html/(.*).html",
          target = "/home/tim/git/storm/storm_hmi/Source/icClient/js/ngController/%1Ctrl.js",
          context = "View->Ctrl"
        },
        {
          pattern = "/home/tim/git/storm/icClientLib/js/ngController/(.*)Ctrl.js",
          target = "/home/tim/git/storm/icClientLib/html/%1.html",
          context = "Ctrl->View"
        },
        {
          pattern = "/home/tim/git/storm/icClientLib/js/ngController/(.*)Ctrl.js",
          target = "/Source/icClient/html/%1.html",
          context = "Ctrl->View"
        },
        {
          pattern = "/Source/icClient/js/ngController/(.*)Ctrl.js",
          target = "/Source/icClient/html/%1.html",
          context = "Ctrl->View"
        },
      },
    },
    keys = {
      { "#",  "<cmd>Other<cr>", desc = "Other File" },
      { "go", "<cmd>Other<cr>", desc = "Other File" }
    },
    config = function(_, opts)
      require('other-nvim').setup(opts)
    end
  }
}
