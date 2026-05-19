return {
  "nvim-mini/mini.files",
  keys = {
    {
      "<leader>e",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = "mini.files(current buffer)", -- (directory of current file)
    },
    {
      "<leader>E",
      function()
        require("mini.files").open(vim.uv.cwd(), true)
      end,
      desc = "mini.files(cwd)",
    },
    {
      "<leader>fm",
      function()
        require("mini.files").open(lazyvim.root(), true)
      end,
      desc = "mini.files (root)",
    },
  },
  opts = {
    options = {
      use_as_default_explorer = true,
    },
    windows = {
      preview = true,
      width_nofocus = 20,
      width_focus = 20,
      width_preview = 50,
    },
    mappings = {
      close = "<Esc>",
      go_in_plus = "<CR>",
    },
  },
}
