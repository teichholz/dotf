return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      "default"
    },
    config = true,
    keys = {
      { "<leader>ff", "<cmd>Fzf files<cr>", desc = "Files" },
      { "<C-x><C-f>", "<cmd>Fzf files<cr>", desc = "Files" },
      {
        "<leader>fd",
        function()
          require('fzf-lua').files { cwd = vim.fn.stdpath("config") }
        end,
        desc = "Find Config",
      },
      { "<leader>fh", "<cmd>Fzf help_tags<cr>",             desc = "Help" },
      { "<leader>fk", "<cmd>Fzf keymaps<cr>",               desc = "Keymaps" },
      { "<leader>fr", "<cmd>Fzf resume<cr>",                desc = "Resume" },
      { "<leader>fb", "<cmd>Fzf buffers<cr>",               desc = "Buffers" },
      { "<leader>fg", "<cmd>Fzf grep_cword<cr>",            desc = "Grep" },
      { "<leader>fG", "<cmd>Fzf live_grep<cr>",             desc = "Project Grep" },

      { "ga",         "<cmd>Fzf lsp_code_actions<cr>",      desc = "Code Actions (Fzf)" },
      { "go",         "<cmd>Fzf lsp_document_symbols<cr>",  desc = "Document Symbols (Fzf)" },
      { "gO",         "<cmd>Fzf lsp_workspace_symbols<cr>", desc = "Project Symbols (Fzf)" },
      { "gd",         "<cmd>Fzf lsp_definitions<cr>",       desc = "Definitions (Fzf)" },
      { "gi",         "<cmd>Fzf lsp_implementations<cr>",   desc = "Implementations (Fzf)" },
      { "gD",         "<cmd>Fzf lsp_references<cr>",        desc = "References (Fzf)" },
    }
  },
  -- {
  --   'nvim-telescope/telescope.nvim',
  --   tag = '0.1.6',
  --   lazy = false,
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  --   },
  --   opts = {
  --     pickers = {
  --       find_files = {
  --         theme = "ivy",
  --         hidden = true
  --       }
  --     }
  --   },
  --   keys = {
  --     {
  --       "<leader>ff",
  --       function()
  --         require('telescope.builtin').find_files {}
  --       end,
  --       desc = "Find Files",
  --     },
  --     {
  --       "<leader>fd",
  --       function()
  --         require('telescope.builtin').find_files {
  --           cwd = vim.fn.stdpath("config")
  --         }
  --       end,
  --       desc = "Find Config",
  --     },
  --     { "<leader>fb", "<cmd>Telescope buffers<cr>",                   desc = "Buffers" },
  --     { "<leader>fh", "<cmd>Telescope help_tags<cr>",                 desc = "Help Tags" },
  --     { "<leader>fg", "<cmd>Telescope live_grep<cr>",                 desc = "Live Grep" },
  --     { "<leader>fo", "<cmd>Telescope oldfiles<cr>",                  desc = "Old Files" },
  --     { "<leader>ft", "<cmd>Telescope filetypes<cr>",                 desc = "File Types" },
  --     { "<leader>fw", "<cmd>Telescope grep_string<cr>",               desc = "Grep String" },
  --     { "<leader>fc", "<cmd>Telescope commands<cr>",                  desc = "Commands" },
  --     { "<leader>fm", "<cmd>Telescope marks<cr>",                     desc = "Marks" },
  --     { "<leader>fr", "<cmd>Telescope registers<cr>",                 desc = "Registers" },
  --     { "<leader>fl", "<cmd>Telescope loclist<cr>",                   desc = "Loclist" },
  --     { "<leader>fq", "<cmd>Telescope quickfix<cr>",                  desc = "Quickfix" },
  --     { "<leader>fs", "<cmd>Telescope spell_suggest<cr>",             desc = "Spell Suggest" },
  --     { "<leader>fh", "<cmd>Telescope help_tags<cr>",                 desc = "Help Tags" },
  --     { "<leader>fv", "<cmd>Telescope vim_options<cr>",               desc = "Vim Options" },
  --     { "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Current Buffer Fuzzy Find" },
  --     { "<leader>fl", "<cmd>Telescope current_buffer_tags<cr>",       desc = "Current Buffer Tags" },
  --     { "<leader>fh", "<cmd>Telescope help_tags<cr>",                 desc = "Help Tags" },
  --   },
  -- }
}
