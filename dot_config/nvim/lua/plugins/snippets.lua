return {
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    keys = {
      { "<C-L>", function() require 'luasnip'.jump(1) end,  mode = {"i", "s"} },
      { "<C-J>", function() require 'luasnip'.jump(-1) end, mode = {"i", "s"} },
      { "<C-K>", function() require 'luasnip'.expand() end, mode = "i" },
      {
        "<C-E>",
        function()
          if require 'luasnip'.choice_active() then
            require 'luasnip'.change_choice(1)
          end
        end,
        mode = { "i", "s" }
      }

    },
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode")
            .lazy_load()
      end
    },
    opts = {}
  }
}
