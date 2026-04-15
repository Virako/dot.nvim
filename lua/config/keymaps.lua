-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { silent = true, noremap = true }
local LazyVim = require("lazyvim.util")
local Snacks = require("snacks")

-- Remove H and L mappings
pcall(vim.keymap.del, "n", "H")
pcall(vim.keymap.del, "n", "L")

-- Remove j and k for avoid gj and gk always
pcall(vim.keymap.del, "n", "j")
pcall(vim.keymap.del, "n", "k")

-- Remove move lines with Alt/Meta
for _, key in ipairs({ "<M-j>", "<M-k>", "<A-j>", "<A-k>" }) do
  pcall(vim.keymap.del, "n", key)
  pcall(vim.keymap.del, "i", key)
  pcall(vim.keymap.del, "v", key)
end

-- Yank like old vim
map("n", "Y", "yy", opts)

-- Buffers: del plugin https://github.com/akinsho/bufferline.nvim, cambiar [b y ]b por C-B y C-T
map("n", "<C-h>", ":bprev<CR>", opts)
map("n", "<C-l>", ":bnext<CR>", opts)

-- Q no hace nada
map("n", "Q", "<nop>", opts)

-- Presentación: cambiar comillas
map("n", "g'", [[V:s/"/'/g<CR>]], { noremap = true })
map("n", 'g"', [[V:s/'/"/g<CR>]], { noremap = true })

-- Snack explorer
map("n", "<F2>", function()
  Snacks.explorer({ cwd = LazyVim.root() })
end, opts)
map("n", "<F3>", function()
  Snacks.explorer()
end, opts)

map("n", "<F7>", function()
  Snacks.picker.grep_word()
end, opts)

-- Eliminar trailing whitespace en todo el fichero
vim.keymap.set("n", "<F12>", function()
  local view = vim.fn.winsaveview()
  vim.cmd([[%s/\s\+$//e]])
  vim.fn.winrestview(view)
end, { desc = "Trim trailing whitespace (buffer)" })

-- C-p to open/close find files
map("n", "<C-p>", LazyVim.pick("files"), { desc = "Find Files (Root Dir)" })

-- Search with grep
map("n", "gs", LazyVim.pick("live_grep"), { desc = "Grep search", silent = true })

-- Test 2e2 with cypress
vim.keymap.set("n", "<leader>te", function()
  vim.cmd("terminal bun run e2e")
end, { desc = "Run Cypress E2E" })

vim.keymap.set("n", "<leader>tf", function()
  local file = vim.fn.expand("%")
  vim.cmd("terminal bun run e2e --spec " .. file)
end, { desc = "Run Cypress current file" })

-- Pytest (tus F5, C-F5, etc.). Review other options
map("n", "<F5>", "<leader>tT", opts)     -- todos los tests
map("n", "<S-F5>", "<leader>tt", opts)   -- tests del fichero
map("n", "<C-F5>", "<leader>tr", opts)   -- test más cercano

-- Exit terminal with <C-q>
vim.keymap.set("t", "<C-q>", [[<C-\><C-n>]], {
  noremap = true,
  silent = true,
  desc = "Salir del terminal sin interrumpir proceso",
})

-- TODO: PlantUML. Review other options
-- map("n", "<leader>uml", "<cmd>!plantuml -tsvg %<CR>", opts)
-- vim.api.nvim_create_user_command("UmlOpenSVG", function()
--   local file = vim.fn.expand("%:p")
--   local svg = vim.fn.expand("%:p:r") .. ".svg"
--   vim.fn.system({ "plantuml", "-tsvg", file })
--   vim.fn.system({ "firefox-esr", svg })
-- end, {})
-- map("n", "<leader>umlo", "<cmd>UmlOpenSVG<CR>", opts)
