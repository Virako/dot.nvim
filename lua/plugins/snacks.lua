return {
  "folke/snacks.nvim",
  version = "*",
  opts = {
    picker = {
      sources = {
        explorer = {
          win = {
            list = {
              keys = {
                ["o"] = "tab", -- open in new tab and open folder
              },
              wo = {
                number = true,
                relativenumber = true,
              },
            },
          },
        },
      },
    },
  },
}
