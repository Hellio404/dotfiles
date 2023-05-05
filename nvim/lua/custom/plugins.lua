local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer"
      }
    }
  },
  {
    "simrat39/rust-tools.nvim",
    ft="rust",
    opts = {
      server = {
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"rust"},
        settings = {
          ["rust-analyzer"] = {
            -- enable clippy on save
            checkOnSave = {
              command = "clippy",
              allTargets = false,
            },
          },
        },
      }
    },
    config = function (_, opts)
      require("rust-tools").setup(opts)
    end 
  }
}

return plugins
