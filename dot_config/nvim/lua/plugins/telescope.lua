return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Old Files" },
      { "<leader>ft", "<cmd>Telescope filetypes<cr>", desc = "File Types" },
      { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Grep String" },
      { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Marks" },
      { "<leader>fr", "<cmd>Telescope registers<cr>", desc = "Registers" },
      { "<leader>fl", "<cmd>Telescope loclist<cr>", desc = "Loclist" },
      { "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix" },
      { "<leader>fs", "<cmd>Telescope spell_suggest<cr>", desc = "Spell Suggest" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
      { "<leader>fv", "<cmd>Telescope vim_options<cr>", desc = "Vim Options" },
      { "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Current Buffer Fuzzy Find" },
      { "<leader>fl", "<cmd>Telescope current_buffer_tags<cr>", desc = "Current Buffer Tags" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
    },
  }
}
