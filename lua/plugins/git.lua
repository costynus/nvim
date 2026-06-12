return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    vim.opt.signcolumn = "yes"

    require("gitsigns").setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "^" },
        changedelete = { text = "~" },
        untracked = { text = "?" },
      },
      signs_staged = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "^" },
        changedelete = { text = "~" },
        untracked = { text = "?" },
      },
      signcolumn = true,
      numhl = true,
      linehl = false,
      word_diff = false,
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, {
            buffer = bufnr,
            desc = desc,
            silent = true,
          })
        end

        map("n", "]g", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, "Next git hunk")

        map("n", "[g", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, "Previous git hunk")

        map("n", "<leader>gp", gitsigns.preview_hunk, "Preview git hunk")
        map("n", "<leader>gb", function()
          gitsigns.blame_line({ full = true })
        end, "Git blame line")
        map("n", "<leader>gd", gitsigns.diffthis, "Git diff current file")

        map("n", "<leader>gs", gitsigns.stage_hunk, "Stage git hunk")
        map("n", "<leader>gr", gitsigns.reset_hunk, "Reset git hunk")
        map("v", "<leader>gs", function()
          gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Stage selected git hunk")
        map("v", "<leader>gr", function()
          gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Reset selected git hunk")

        map("n", "<leader>gS", gitsigns.stage_buffer, "Stage git buffer")
        map("n", "<leader>gR", gitsigns.reset_buffer, "Reset git buffer")
        map("n", "<leader>gB", gitsigns.toggle_current_line_blame, "Toggle git blame")
        map("n", "<leader>gl", gitsigns.toggle_linehl, "Toggle git line highlight")
        map("n", "<leader>gn", gitsigns.toggle_numhl, "Toggle git number highlight")
        map("n", "<leader>gw", gitsigns.toggle_word_diff, "Toggle git word diff")

        map({ "o", "x" }, "ih", gitsigns.select_hunk, "Git hunk text object")
      end,
    })
  end,
}
