return {
  {
    "loctvl842/monokai-pro.nvim",
    -- Pin exacto: v2.1.2+ mapea NormalFloat a editorSuggestWidget (fondo gris)
    -- y rompe transparent_background. No usar `version = "*"`.
    version = "v2.1.1",
    opts = {
      transparent_background = true,
      override = function(c)
        return {
          SnacksIndent = { fg = c.base.dimmed4 },
          -- Si usas chunks de Snacks
          SnacksIndentChunk = { fg = c.base.dimmed4 },
          SnacksIndentChunkLine = { fg = c.base.dimmed4 },

          -- split separator
          WinSeparator = { fg = "#baa0f8" },
          VertSplit = { fg = "#baa0f8" },

          ExtraWhitespace = { bg = "#592929" },
          ColorColumn = { bg = "#696969" },
        }
      end,
    },
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "monokai-pro-machine" } },
}
