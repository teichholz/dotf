local lspConf = {}
lspConf['sumneko_lua'] = {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
        }
      }
    },
  },
}

lspConf['bashls'] = {
	filetypes = {"sh", "zsh", "bash"},
	cmd_env = {
		GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)|*zsh*"
	},
}
lspConf['rnix'] = {}
lspConf['pyright'] = {}
lspConf['tsserver'] = {}

-- needed for jsonls
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
lspConf['jsonls'] = {
  capabilities = capabilities,
}

lspConf['ccls']= {
  init_options = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = { "-frounding-math"} ;
    };
  }
}
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
--local wk = require("which-key")
local map = Lib.Keys.map
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  local g = {
    D = { vim.lsp.buf.declaration, "Go to declaration" },
    d = { vim.lsp.buf.definition, "Go to definition" },
    i = { vim.lsp.buf.implementation, "Go to implementation"},
    ["gr"] = {'<cmd>Telescope lsp_references theme=ivy<cr>', "Go to referencens" }
  }
  local leader = {
    w = {
      name = "Workspace",
      a = { vim.lsp.buf.add_workspace_folder, "Add workspace folder" },
      r = { vim.lsp.buf.remove_workspace_folder, "Remove workspace folder" },
      l = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "Print workspace folders" },
    },
    c = {
      name = "Code",
      D = { vim.lsp.buf.type_definition, "Type definitions" },
      i = { '<cmd>Telescope lsp_document_symbols theme=ivy<cr>', "Show symbols" },
      r = { vim.lsp.buf.rename, "Rename" },
      a = { vim.lsp.buf.code_action, "Code action" },
      f = { vim.lsp.buf.formatting, "Format buffer" },
    },
  }
  --wk.register(g, { prefix = "g", mode = "n" })
  --wk.register(leader, { prefix = "<leader>", mode = "n" })

  map('n', 'K', vim.lsp.buf.hover, bufopts)
  map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
end

local lsp_flags = {}
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


for server, lspc in pairs(lspConf) do
  local conf = {
    on_attach = on_attach,
    flags = lsp_flags,
		capabilities = capabilities
	}

  Lib.Table.extend(conf, lspc)

	require('lspconfig')[server].setup(conf)
end

-- auto install configured lsp servers
require("mason-lspconfig").setup{
  automatic_installation = true,
}

-- show progress of lsp server startup / indexing
-- require"fidget".setup{}
