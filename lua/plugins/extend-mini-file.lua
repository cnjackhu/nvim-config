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
  opts = function(_, opts)
    opts.options = {
      use_as_default_explorer = true,
    }
    opts.windows = {
      preview = true,
      width_nofocus = 20,
      width_focus = 20,
      width_preview = 50,
    }
    opts.mappings = {
      close = "<Esc>",
      go_in_plus = "<CR>",
    }
    -- 2. Insert the Split Window Functionality
    -- =====================================================================
    local mini_files_group = vim.api.nvim_create_augroup("LazyVimMiniFilesSplit", { clear = true })

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      group = mini_files_group,
      callback = function(args)
        local buf_id = args.data.buf_id

        local map_split = function(lhs, direction)
          local rhs = function()
            -- Get target window
            local cur_target = MiniFiles.get_explorer_state().target_window

            -- Make new window split and set it as target
            local new_target = vim.api.nvim_win_call(cur_target, function()
              vim.cmd(direction .. " split")
              return vim.api.nvim_get_current_win()
            end)

            MiniFiles.set_target_window(new_target)

            -- Optional: Uncomment the line below if you want to immediately
            -- open the file and close the explorer guide upon split layout
            MiniFiles.go_in()
            -- E. 【体验优化】打开文件后，自动关闭 mini.files 文件树窗口
            MiniFiles.close()
          end

          -- Apply keymap to the specific mini.files buffer
          vim.keymap.set("n", lhs, rhs, {
            buffer = buf_id,
            desc = "Split " .. direction,
          })
        end

        -- Map your split triggers
        map_split("<C-s>", "belowright horizontal") -- Ctrl + s for horizontal split
        map_split("<C-v>", "belowright vertical") -- Ctrl + v for vertical split
        map_split("<C-t>", "tab") -- Ctrl + t for new tab
      end,
    })

    -- =====================================================================
    -- 3. Return the modified opts back to LazyVim
    -- =====================================================================
    return opts
  end,
}
