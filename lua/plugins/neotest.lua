return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "marilari88/neotest-vitest",
    },
    opts = function(_, opts)
      opts.discovery = opts.discovery or {}
      opts.discovery.enabled = false
      opts.discovery.filter_dir = function(name)
        return not vim.tbl_contains({
          "node_modules",
          ".git",
          "dist",
          "build",
          ".turbo",
          ".next",
          "coverage",
          ".venv",
          ".nyc_output",
        }, name)
      end

      opts.running = opts.running or {}
      opts.running.concurrent = 1

      opts.summary = opts.summary or {}
      opts.summary.animated = false

      opts.adapters = opts.adapters or {}

      table.insert(opts.adapters, require("neotest-python")({
        runner = "pytest",
        is_test_file = function(file_path)
          return file_path:match("test_.+%.py$")
            or file_path:match("tests_.+%.py$")
            or file_path:match(".+_test%.py$")
            or file_path:match("/tests/.+%.py$")
            or file_path:match("/tests%.py$")
        end,
      }))

      table.insert(opts.adapters, require("neotest-vitest")({
        vitestCommand = "npx vitest run",
        cwd = function(path)
          local pkg = vim.fs.find({ "package.json" }, { upward = true, path = path })[1]
          return pkg and vim.fs.dirname(pkg) or vim.fn.getcwd()
        end,
      }))
    end,
  },
}
