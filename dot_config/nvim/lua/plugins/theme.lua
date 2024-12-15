return {
  -- {
  --   'stevearc/dressing.nvim',
  --   opts = {},
  --   config = true
  -- },
  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = true,
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        overrije = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      popupmenu = {
        enabled = true
      },
      notify = {
        enabled = true
      },
      messages = {
        -- atm messages causes ui problems for me
        enabled = false
      }
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  { 'rakr/vim-one' },
  {
    'Mofiqul/dracula.nvim',
    config = function()
      vim.g.edge_style = "aura"
      vim.g.edge_better_performance = 0
      vim.cmd("colorscheme dracula")
    end
  }
}
