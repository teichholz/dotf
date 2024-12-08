return {
  { "williamboman/mason.nvim",                     config = true },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()

      require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name) -- default handler (optional)
          local capabilities = require('cmp_nvim_lsp').default_capabilities()
          require("lspconfig")[server_name].setup {
            capabilities = capabilities
          }
        end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
      }
    end
  },
  {
    "neovim/nvim-lspconfig",
    keys = {
      { "go",     "<cmd>Telescope lsp_document_symbols<cr>",          desc = "Document Symbols (Telescope)" },
      { "gf",     "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Dynamic Workspace Symbols (Telescope)" },
      { "gd",     "<cmd>Telescope lsp_definitions<cr>",               desc = "Definitions (Telescope)" },
      { "gi",     "<cmd>Telescope lsp_implementations<cr>",           desc = "Implementations (Telescope)" },
      { "gD",     "<cmd>Telescope lsp_references<cr>",                desc = "References (Telescope)" },
      { "cr",     vim.lsp.buf.rename,                                 desc = "Rename" },
      { "ca",     vim.lsp.buf.code_action,                            desc = "Code Action" },
      { "<cmd>.", vim.lsp.buf.code_action,                            desc = "Code Action" },
      { "cf",     vim.lsp.buf.format,                                 desc = "Format" },
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "go", "rust" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  {
    "windwp/nvim-ts-autotag",
    opts = true,
    config = {
      opts = {
        -- Defaults
        enable_close = true,      -- Auto close tags
        enable_rename = true,     -- Auto rename pairs of tags
        enable_close_on_slash = false -- Auto close on trailing </
      },
      -- Also override individual filetype configs, these take priority.
      -- Empty by default, useful if one of the "opts" global settings
      -- doesn't work well in a specific filetype
      per_filetype = {
        ["html"] = {
          enable_close = false
        }
      }
    }
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = true,
    keys = { {
      "[c", function() require("treesitter-context").go_to_context(vim.v.count1) end, desc = "Go to upper context"
    } }
  },
  { "nvim-treesitter/nvim-treesitter-textobjects", dependencies = { "nvim-treesitter/nvim-treesitter" } },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
    opts = {}, -- for default options, refer to the configuration section for custom setup.
  },
  -- UI for notifications in general as well as lsp notifications
  {
    "j-hui/fidget.nvim",
    config = true,
  }
}
