return {
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      vim.api.nvim_create_autocmd("VimEnter", {
        once = true,
        callback = function()
          vim.schedule(function()
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buftype == "" then
                local ft = vim.bo[buf].filetype
                if ft and ft ~= "" then
                  vim.api.nvim_buf_call(buf, function()
                    vim.cmd("silent! edit")
                  end)
                end
              end
            end
          end)
        end,
      })
    end,
  },
}
