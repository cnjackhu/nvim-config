return {
  -- 1. Install the Catppuccin plugin and configure the Frappé flavor
  {
    "catppuccin/nvim",
    name = "catppuccin", -- Ensure Neovim knows it by this name
    opts = {
      flavour = "frappe", -- Lock it to the exact flavor you want
    },
  },

  -- 2. Configure LazyVim core to use 'catppuccin' as the active colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      -- Note: Here we use "catppuccin" (the general plugin name)
      -- The 'opts' block above handles switching the flavor to 'frappe'
      colorscheme = "catppuccin",
    },
  },
}
