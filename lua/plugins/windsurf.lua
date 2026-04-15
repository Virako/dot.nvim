-- Codeium (Windsurf) AI completion source for blink.cmp.
-- To re-enable codeium:
--   1. Run `:LazyExtras` and activate `lazyvim.plugins.extras.ai.codeium`.
--   2. Uncomment the `dependencies`, `providers` and the `codeium` entry in
--      `sources.default` below.
return {
  "saghen/blink.cmp",
  -- dependencies = {
  --   {
  --     "Exafunction/codeium.nvim",
  --   },
  -- },
  opts = {
    keymap = { preset = "super-tab" },
    completion = { documentation = { auto_show = false } },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" --[[ , "codeium" ]] },
      -- providers = {
      --   codeium = { name = "Codeium", module = "codeium.blink", async = true },
      -- },
    },
  },
}
