return {
  "folke/trouble.nvim",
  keys = {
    {
      "<F8>",
      "<cmd>Trouble symbols toggle focus=true<CR>",
      desc = "Document Symbols",
    },
    {
      "<F9>",
      "<cmd>Trouble lsp_document_symbols toggle win.position=right focus=true<CR>",
      desc = "Document Symbols (LSP)",
    },
  },
}
