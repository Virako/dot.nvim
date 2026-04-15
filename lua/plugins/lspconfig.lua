return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        pyright = {
          settings = {
            pyright = {
              disableTaggedHints = true,
            },
            python = {
              analysis = {
                typeCheckingMode = "base", -- base o "strict" si te apetece sufrir 😄
                autoSearchPaths = true,
                autoImportCompletions = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly", -- mejor rendimiento
              },
            },
          },
        },
        ruff = {
          on_attach = function(client, _)
          end
        },
        pylsp = { enabled = false },
      },
    },
  }
}
