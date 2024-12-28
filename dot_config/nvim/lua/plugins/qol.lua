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
      input = { enabled = true },
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

  -- Basic configuration
  {
    'echasnovski/mini.basics',
    version = false,
    opts = {
      mappings = { windows = true },
      config = true
    }
  },
  -- Columnar file viewer
  {
    'echasnovski/mini.files',
    version = false,
    keys = {
      { "<leader>of", function() MiniFiles.open() end, desc = "File Browser" }
    },
    config = true
  },
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
  { 'echasnovski/mini.surround',  version = false, config = true },

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
        }
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
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
  -- which key like key hints
  {
    'echasnovski/mini.clue',
    version = false,
    opts = {
      triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },

        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },

        -- c key for code actions
        { mode = 'n', keys = 'c' },

        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },

        { mode = 'n', keys = '[' },
        { mode = 'n', keys = ']' },

        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },

        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },

        -- Window commands
        { mode = 'n', keys = '<C-w>' },

        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
      },
    }
  },
}
