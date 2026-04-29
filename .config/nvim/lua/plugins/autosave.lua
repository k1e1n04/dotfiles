return {
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup({
        enabled = true, -- 起動時に有効化
        execution_message = {
          message = function() return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S")) end,
          cleaning_interval = 1000,
        },
        trigger_events = { "InsertLeave", "TextChanged" }, -- 挿入モードを抜けた時、またはテキストが変わった時
        -- 保存したくない条件（特定のファイルタイプなど）
        condition = function(buf)
          local fn = vim.fn
          local utils = require("auto-save.utils.data")
          if fn.getbufvar(buf, "&modifiable") == 1 and
             utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
            return true
          end
          return false
        end,
      })
    end,
  },
}
