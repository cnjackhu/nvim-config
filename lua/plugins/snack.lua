return {
  {
    "folke/snacks.nvim",
    -- Your existing key overrides
    keys = {
      { "<leader>E", false }, -- <leader>fe/E still work
      { "<leader>e", false },
      { "<leader>fE", false }, -- <leader>fe/E still work
      { "<leader>fe", false },
    },
    opts = {
      picker = {
        focus = "list",
        win = {
          preview = {
            wo = {
              wrap = true, -- 开启预览窗格自动换行
              linebreak = true, -- 尽可能在单词边界处换行，防止单词被切断
            },
          },
        },
      },
      styles = {
        notification = {
          wo = {
            wrap = true, -- Enable line wrapping for notification windows
          },
        },
      },
      explorer = {
        enabled = false,
      },
    },
  },
}
