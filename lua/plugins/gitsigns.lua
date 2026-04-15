return {
  "lewis6991/gitsigns.nvim",
  opts = function(_, opts)
    -- Mantén lo que ya hubiera
    opts = opts or {}

    -- Signos tipo Signify
    opts.signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "-" },
      topdelete = { text = "-" },
      changedelete = { text = "~" },
    }

    -- Nos aseguramos de tener una columna de signos dedicada
    -- vim.opt.signcolumn = "yes"

    -- on_attach para poner los mappings estilo Signify por buffer
    -- local old_on_attach = opts.on_attach
    -- opts.on_attach = function(bufnr)
    --   if old_on_attach then
    --     old_on_attach(bufnr)
    --   end
    --
    --   local gs = package.loaded.gitsigns
    --   local function map(mode, lhs, rhs, desc)
    --     vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
    --   end
    -- end

    return opts
  end,
}
