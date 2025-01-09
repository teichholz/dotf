return {
  { "williamboman/mason.nvim",                     config = true },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local handlers = {
        function(server_name) -- default handler (optional)
          local caps = require('blink.cmp').get_lsp_capabilities()
          require("lspconfig")[server_name].setup {
            capabilieties = caps
          }
        end,

        ["bashls"] = function()
          require("lspconfig").bashls.setup {
            filetypes = { "bash", "zsh", "sh" },
            capabilieties = require('blink.cmp').get_lsp_capabilities()
          }
        end
      }

      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "bashls" },
        automatic_installation = true,
        handlers = handlers
      }
    end
  },
  {
    "neovim/nvim-lspconfig",
    keys = {
      { "cr",         vim.lsp.buf.rename, desc = "Rename" },
      -- { "cf",         vim.lsp.buf.format, desc = "Format" },
      { "<leader>cr", vim.lsp.buf.rename, desc = "Rename" },
      -- { "<leader>cf", vim.lsp.buf.format, desc = "Format" },
    },
  },
  {
    'stevearc/conform.nvim',
    lazy = false,
    opts = {
      formatters_by_ft = {
        python = { "isort", "black" },
        javascript = { "prettierd", "prettier", stop_after_first = true, lsp_format = "prefer" },
        zsh = { "shellharden" },
        sh = { "shellharden" },
        bash = { "shellharden" },
      },
      format_on_save = function(bufnr)
        if not vim.g.autoformat then
          return
        end

        return {
          timeout_ms = 500,
          lsp_format = "fallback",
        }
      end,
    },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ lsp_format = "fallback", bufnr = vim.api.nvim_get_current_buf() })
        end,
        mode = { "n", "o", "x" },
        desc = "Format"
      },
      {
        "cf",
        function()
          require("conform").format({ lsp_format = "fallback", bufnr = vim.api.nvim_get_current_buf() })
        end,
        mode = { "n", "o", "x" },
        desc = "Format"
      },
    },
  },
  {
    'stevearc/conform.nvim',
    opts = function()
      Snacks.toggle({
        name = "Autoformat",
        get = function()
          return vim.g.autoformat == nil or vim.g.autoformat
        end,
        set = function(state)
          vim.g.autoformat = state
        end,
      }):map("<leader>uF")
    end,
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      require('lint').linters_by_ft = {
        javascript = { 'eslint_d' },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    opts = function(_, opts)
      local null_ls = require("null-ls")
      opts.root_dir = opts.root_dir
          or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
      opts.sources = vim.list_extend(opts.sources or {}, {
        require("none-ls.code_actions.eslint"),
      })
      opts.on_attach = opts.on_attach
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        -- add lazydev to your completion providers
        default = { "lazydev" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100, -- show at a higher priority than lsp
          },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "go", "rust", "python", "regex", "bash" },
        auto_install = true,
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
        enable_close = true,          -- Auto close tags
        enable_rename = true,         -- Auto rename pairs of tags
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
}
