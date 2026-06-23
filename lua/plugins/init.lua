return {
  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-web-devicons").setup({
        default = true,
      })
      require("nvim-tree").setup({
        filters = {
          git_ignored = false,
        },
        view = {
          width = 30,
          side = "left",
        },
        renderer = {
          indent_markers = {
            enable = true,
          },
          highlight_opened_files = "name",
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
      })

      vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>", {
        desc = "Refresh file tree",
        silent = true,
      })
      vim.keymap.set("n", "<C-n>", ":NvimTreeFindFileToggle<CR>", {
        desc = "Find current file in tree",
        silent = true,
      })
    end,
  },
}
