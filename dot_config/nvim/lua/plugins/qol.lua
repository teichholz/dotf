return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = false },
      indent = { enabled = false },
      input = { enabled = false },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = false },
    },
    keys = {
      { "<leader>z", function() Snacks.zen() end,                     desc = "Toggle Zen Mode" },
      { "<leader>Z", function() Snacks.zen.zoom() end,                desc = "Toggle Zoom" },
      { "<leader>.", function() Snacks.scratch() end,                 desc = "Toggle Scratch Buffer" },
      { "]]",        function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Reference",       mode = { "n", "t" } },
      { "[[",        function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference",       mode = { "n", "t" } },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd -- Override print to use snacks for `:=` command
        end,
      })
    end,
  },

  -- vim.ui.select and vim.ui.input
  {
    'stevearc/dressing.nvim',
    opts = {},
  },

  -- Basic configuration
  {
    'echasnovski/mini.basics',
    version = false,
    opts = {
      mappings = { windows = true },
      config = true
    }
  },
  -- columnar file viewer
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    lazy = false,
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    keys = {
      { "-", function() vim.cmd("Oil") end, desc = "Oil Browser" }
    }
  },
  -- tree file viewer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
      window = {
        mappings = {
          ["Z"] = "expand_all_nodes",
          ["l"] = "set_root",
          ["h"] = "navigate_up",
          ["."] = "toggle_hidden",
        }
      }
    },
    keys = {
      { "<leader>oF", function() vim.cmd("Neotree position=current") end, desc = "File Tree" }
    },
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    opts = {
      fast_wrap = {
        map = '<C-e>',
      }
    }
    -- this is equalent to setup({}) function
  },

  -- More intuitive marks + mark signs
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Surround plugin
  {
    'echasnovski/mini.surround',
    version = false,
    opts = {
      mappings = {
        add = "gsa",            -- Add surrounding in Normal and Visual modes
        delete = "gsd",         -- Delete surrounding
        find = "gsf",           -- Find surrounding (to the right)
        find_left = "gsF",      -- Find surrounding (to the left)
        highlight = "gsh",      -- Highlight surrounding
        replace = "gsr",        -- Replace surrounding
        update_n_lines = "gsn", -- Update `n_lines`
        suffix_last = 'p',      -- Suffix to search with "prev" method
        suffix_next = 'n',      -- Suffix to search with "next" method
      },
    },
    config = true
  },

  -- move visual blocks
  { 'echasnovski/mini.move',      version = false, config = true },

  -- move visual blocks as well as exchange operator
  { 'echasnovski/mini.operators', version = false, config = true },

  -- treesitter text objects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  -- More text objects, automatic jump into next / previous text object
  -- use treesitter objects
  {
    'echasnovski/mini.ai',
    version = false,
    opts = function(plug, opts)
      local spec_treesitter = require('mini.ai').gen_spec.treesitter
      return {
        custom_textobjects = {
          F = spec_treesitter({ a = '@function.outer', i = '@function.inner' }),
          o = spec_treesitter({
            a = { '@conditional.outer', '@loop.outer' },
            i = { '@conditional.inner', '@loop.inner' },
          })
        },
      }
    end,
    config = true,
  },

  -- Split / join arguments to functions, gS is keybind
  {
    'Wansmer/treesj',
    keys = {
      { "gS", mode = { "n", "x", "o" }, function() require("treesj").toggle() end, desc = "Toggle Tree" },
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
    config = true,
    opts = {}
  },
  {
    'stevearc/overseer.nvim',
    opts = {},
    lazy = false,
    keys = {
      { "<leader>tr", "<cmd>OverseerRun<cr>",         desc = "Run Task" },
      { "<leader>tm", "<cmd>OverseerToggle<cr>",      desc = "Task History" },
      { "<leader>tl", "<cmd>OverseerRestartLast<cr>", desc = "Run Last Task" },
    },
    config = function(_, opts)
      require('overseer').setup(opts)

      vim.api.nvim_create_user_command("OverseerRestartLast", function()
        local overseer = require("overseer")
        local tasks = overseer.list_tasks({ recent_first = true })
        if vim.tbl_isempty(tasks) then
          vim.notify("No tasks found", vim.log.levels.WARN)
        else
          overseer.run_action(tasks[1], "restart")
        end
      end, {})

      vim.api.nvim_create_user_command("Make", function(params)
        -- Insert args at the '$*' in the makeprg
        local cmd, num_subs = vim.o.makeprg:gsub("%$%*", params.args)
        if num_subs == 0 then
          cmd = cmd .. " " .. params.args
        end
        local task = require("overseer").new_task({
          cmd = vim.fn.expandcmd(cmd),
          components = {
            { "on_output_quickfix", open = not params.bang, open_height = 8 },
            "default",
          },
        })
        task:start()
      end, {
        desc = "Run your makeprg as an Overseer task",
        nargs = "*",
        bang = true,
      })
    end
  }
}
