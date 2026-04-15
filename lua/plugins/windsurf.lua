return {
  "saghen/blink.cmp",
  dependencies = {
    {
      "Exafunction/codeium.nvim",
    },
  },
  opts = {
    keymap = { preset = "super-tab" },
    completion = { documentation = { auto_show = false } },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "codeium" },
      providers = {
        codeium = { name = "Codeium", module = "codeium.blink", async = true },
      },
    },
  },
  -- "Exafunction/codeium.nvim",
  -- opts = {
  --   enable_cmp_source = vim.g.ai_cmp,
  --   virtual_text = {
  --     enabled = not vim.g.ai_cmp,
  --     key_bindings = {
  --       accept = true,
  --       next = "<C-s>",
  --       prev = "<C-f>",
  --     },
  --   },
  -- },
}
