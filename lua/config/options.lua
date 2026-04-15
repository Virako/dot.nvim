-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.colorcolumn = "88"
opt.scrolloff = 0
-- opt.textwidth = 120

-- wrap line
opt.wrap = true
opt.linebreak = true
opt.breakindent = true

-- mouse like in vim
opt.mouse = ""

-- wildignore extra (LazyVim ya pone algunas)
opt.wildignore:append({
  "**/env/**",
  "**/lib/**",
  "**/bin/**",
  "**/node_modules/**",
  "**/.ruff_cache/**",
  "**/.mypy_cache/**",
  "**/.pytest_cache/**",
  "*/tmp/*",
  "*.so",
  "*.swp",
  "*.zip",
  "*.pyc",
  "*.db",
  "*.sqlite",
})

opt.signcolumn = "yes"
-- Disable animations
vim.g.snacks_animate = false

vim.g.autoformat = false
