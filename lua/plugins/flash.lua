return {
  "folke/flash.nvim",
  keys = {
    -- disable the default flash keymap
    { "s", mode = { "n", "x", "o" }, false },
    { "S", mode = { "n", "x", "o" }, false },
  },
  opts = {
    highlight = {
      backdrop = false, -- remove dimer when f, F, t or T
    },
    modes = {
      char = {
        highlight = {
          backdrop = false, -- remove dimer when f, F, t or T
        },
      },
    },
  },
}
