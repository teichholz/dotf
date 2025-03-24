function Expand(partial, fallback)
  local luasnip = require('luasnip')
  local suggestion = require('supermaven-nvim.completion_preview')

  if luasnip.expandable() then
    luasnip.expand()
  elseif suggestion.has_suggestion() then
    suggestion.on_accept_suggestion(partial)
  else
    if fallback then
      fallback()
    end
  end
end

return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
    opts = {
      provider = "claude",
      max_tokens = 4096,
    },
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      -- optional
      "ibhagwan/fzf-lua",
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    "supermaven-inc/supermaven-nvim",
    lazy = false,
    opts = {
      keymaps = {
        accept_suggestion = "<C-l>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
      ignore_filetypes = {},
      disable_inline_completion = false,
    },
    config = true,
    keys = {
      { "<C-l>", function() Expand(false) end, mode = "i" },
      { "<C-j>", function() Expand(true) end,  mode = "i" },
    }
  }
}
