return {
  -- https://www.josean.com/posts/nvim-treesitter-and-textobjects
  "nvim-mini/mini.ai",
  opts = function(_, opts)
    local ai = require("mini.ai")

    -- 将你的自定义对象强行注入到 LazyVim 的默认配置中
    opts.custom_textobjects = vim.tbl_deep_extend("force", opts.custom_textobjects or {}, {

      -- 1. 整个赋值语句 (使用 = 键触发)
      ["="] = ai.gen_spec.treesitter({
        a = "@assignment.outer",
        i = "@assignment.inner",
      }),

      -- 2. 赋值等号的左半部分 LHS (使用 l 键触发)
      ["l"] = ai.gen_spec.treesitter({
        a = "@assignment.lhs",
        i = "@assignment.lhs", -- 左右两边通常无内外之分，统一即可
      }),

      -- 3. 赋值等号的右半部分 RHS (使用 r 键触发)
      ["r"] = ai.gen_spec.treesitter({
        a = "@assignment.rhs",
        i = "@assignment.rhs",
      }),
    })
  end,
}
