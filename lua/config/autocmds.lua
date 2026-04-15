-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Show Trailing space only in normal buffers (avoid in noice, snacks_picker, ...)
local deny_ft = {
  "noice",
  "snacks_picker",
  "snacks_input",
  "TelescopePrompt",
  "lazy",
  "mason",
  "help",
}

local function is_normal_buffer(buf)
  if not vim.api.nvim_buf_is_valid(buf) then
    return false
  end

  local bt = vim.bo[buf].buftype
  if bt ~= "" then
    return false
  end -- prompt/nofile/help/terminal/etc

  if not vim.bo[buf].buflisted then
    return false
  end
  if not vim.bo[buf].modifiable then
    return false
  end

  local ft = vim.bo[buf].filetype
  for _, v in ipairs(deny_ft) do
    if ft == v then
      return false
    end
  end

  return true
end

local function enable_trailing_ws(win)
  win = win or 0
  local buf = vim.api.nvim_win_get_buf(win)

  if not is_normal_buffer(buf) then
    -- si es ventana/buffer especial, asegúrate de no pintar ahí
    if vim.w[win]._trail_ws_id then
      pcall(vim.fn.matchdelete, vim.w[win]._trail_ws_id)
      vim.w[win]._trail_ws_id = nil
    end
    return
  end

  if vim.w[win]._trail_ws_id then
    return
  end
  vim.w[win]._trail_ws_id = vim.fn.matchadd("ExtraWhitespace", [[\s\+$]])
end

local function disable_trailing_ws(win)
  win = win or 0
  if vim.w[win]._trail_ws_id then
    pcall(vim.fn.matchdelete, vim.w[win]._trail_ws_id)
    vim.w[win]._trail_ws_id = nil
  end
end

-- Activa en ventanas “normales”
vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter", "InsertLeave" }, {
  callback = function()
    enable_trailing_ws(0)
  end,
})

-- Desactiva al escribir (opcional)
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    disable_trailing_ws(0)
  end,
})

-- Y cada vez que cambie el tipo de buffer/ventana, re-evalúa
vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
  callback = function()
    enable_trailing_ws(0)
  end,
})

-- sync colorcolumn with textwidth
local function sync_colorcolumn(bufnr)
  bufnr = bufnr or 0

  local tw = vim.bo[bufnr].textwidth
  if not tw or tw <= 0 then
    vim.wo.colorcolumn = ""
    return
  end

  vim.wo.colorcolumn = tostring(tw)
end

-- Disable spell on markdown/text/gitcommit (LazyVim enables it by default)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "FileType", "OptionSet" }, {
  callback = function(args)
    if args.event == "OptionSet" and args.match ~= "textwidth" then
      return
    end
    sync_colorcolumn(args.buf)
  end,
})
