return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    -- 0) indent change symbol
    opts.indent = opts.indent or {}
    opts.indent.indent = opts.indent.indent or {}
    opts.indent.scope = opts.indent.scope or {}
    opts.indent.chunk = opts.indent.chunk or {}

    opts.indent.char = "¦"
    opts.indent.indent.char = "¦"
    opts.indent.scope.char = "¦"
    opts.indent.chunk.char = "¦"

    -- 1) statuscolumn
    opts.statuscolumn = opts.statuscolumn or {}
    opts.statuscolumn.left = {
      "mark", "git"
    }
    opts.statuscolumn.right = {
      "sign", "fold"
    }

    -- 2) sections
    opts.dashboard = opts.dashboard or {}
    opts.dashboard.sections = {
      { icon = " ", title = "Recent Files (cwd)", section = "recent_files", cwd = true, indent = 2, padding = 1 },
      { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
      { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
      {
        icon = " ",
        title = "Git Status",
        section = "terminal",
        enabled = function()
          return Snacks.git.get_root() ~= nil
        end,
        cmd = "git status --short --branch --renames",
        height = 5,
        padding = 1,
        ttl = 5 * 60,
        indent = 2,
      },
      {
        icon = " ",
        key = "c",
        desc = "Config",
        action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
      },
      { icon = " ", key = "s", desc = "Restore Session", section = "session" },
      { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
      { icon = "", key = "x", desc = "LazyExtras", action = ":LazyExtras", enabled = package.loaded.lazy ~= nil },
      { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      { section = "startup" },
    }
  end,
}
