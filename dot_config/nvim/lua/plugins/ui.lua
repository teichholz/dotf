return {
  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  -- which key like key hints
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  {
    'stevearc/quicker.nvim',
    event = "FileType qf",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {},
  },
  {
    'Bekaboo/dropbar.nvim',
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    },
    config = function(_, opts)
      local dropbar_api = require('dropbar.api')
      local dropbar_opts = require('dropbar.configs').opts
      local enable = function(buf, win, _)
        if not vim.g.breadcrumbs then
          return false
        end
        return dropbar_opts.bar.enable(buf, win, _)
      end
      local opts = {
        bar = {
          enable = enable,
        }
      }
      require('dropbar').setup(opts)
      vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
      vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
      vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
    end
  },
  {
    'Bekaboo/dropbar.nvim',
    opts = function()
      Snacks.toggle({
        name = "Breadcrumbs",
        get = function()
          return vim.g.breadcrumbs == nil or vim.g.breadcrumbs
        end,
        set = function(state)
          vim.g.breadcrumbs = state
        end,
      }):map("<leader>uB")
    end,
  },
  {
    'akinsho/bufferline.nvim',
    lazy = false,
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        style_preset = 2,
        close_command = function(n) Snacks.bufdelete(n) end,
        right_mouse_command = function(n) Snacks.bufdelete(n) end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
    keys = {
      { "<C-1>", "<cmd>BufferLineGoToBuffer 1<cr>", "Tab 1" },
      { "<C-2>", "<cmd>BufferLineGoToBuffer 2<cr>", "Tab 2" },
      { "<C-3>", "<cmd>BufferLineGoToBuffer 3<cr>", "Tab 3" },
      { "<C-3>", "<cmd>BufferLineGoToBuffer 4<cr>", "Tab 4" },
      { "<C-3>", "<cmd>BufferLineGoToBuffer 5<cr>", "Tab 5" },
    },
    config = function(_, opts)
      require('bufferline').setup(opts)
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local line = require("evilline")
      require("lualine").setup(line)
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true
    },
    config = true
  },
  { 'rakr/vim-one' },
  {
    'Mofiqul/dracula.nvim',
    config = function()
      vim.g.edge_style = "aura"
      vim.g.edge_better_performance = 0
    end
  }
}
