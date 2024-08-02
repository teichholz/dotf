return {
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
  -- Auto pair
  -- { 'echasnovski/mini.pairs',  version = false, config = true },
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


  -- Surround plugin
  { 'echasnovski/mini.surround',  version = false, config = true },
  -- Split / join arguments to functions
  { 'echasnovski/mini.splitjoin', version = false, config = true },
  -- More text objects
  -- use treesitter objects
  { 'echasnovski/mini.ai',        version = false, config = true },
  -- Make f, t work over multiple lines
  { 'echasnovski/mini.jump',      version = false, config = true },
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
