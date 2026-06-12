return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      direction = "float",
      start_in_insert = true,
      persist_size = false,
      float_opts = {
        border = "rounded",
        width = function()
          return math.floor(vim.o.columns * 0.7)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.35)
        end,
        row = function()
          return math.floor(vim.o.lines * 0.1)
        end,
        col = function()
          return math.floor((vim.o.columns - (vim.o.columns * 0.7)) / 2)
        end,
        winblend = 0,
      },
      size = function(term)
        if term.direction == "vertical" then
          return math.floor(vim.o.columns * 0.4)
        end
        return 15
      end,
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      local Terminal = require("toggleterm.terminal").Terminal

      local python = Terminal:new({
        cmd = "python3",
        hidden = true,
        direction = "float",
      })

      local markdown_preview = Terminal:new({
        hidden = true,
        direction = "vertical",
        close_on_exit = false,
      })

      vim.keymap.set("n", "<leader>py", function()
        python:toggle()
      end, { desc = "Python REPL" })

      vim.keymap.set("n", "<leader>md", function()
        if vim.fn.executable("glow") == 0 then
          vim.notify("glow is not installed", vim.log.levels.WARN)
          return
        end

        local file = vim.api.nvim_buf_get_name(0)
        if file == "" then
          vim.notify("Save the current buffer before previewing it", vim.log.levels.WARN)
          return
        end

        markdown_preview.cmd = "glow " .. vim.fn.shellescape(file)
        markdown_preview:toggle()
      end, { desc = "Preview Markdown with glow" })

      vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", {
        desc = "Terminal",
      })

      vim.keymap.set("t", "<leader>tt", [[<C-\><C-n><cmd>ToggleTerm<CR>]], {
        silent = true,
      })

      vim.keymap.set(
        "t",
        "<leader>py",
        [[<C-\><C-n><cmd>lua require("toggleterm.terminal").get(1):toggle()<CR>]],
        { silent = true }
      )

      vim.keymap.set("t", "<C-q>", [[<C-\><C-n><cmd>close<CR>]], {
        silent = true,
      })
    end,
  },
}
