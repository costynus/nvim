return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find files",
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Grep project",
      },
      {
        "<leader>fw",
        function()
          require("telescope.builtin").grep_string({
            word_match = "-w",
          })
        end,
        desc = "Grep word under cursor",
      },
    },
    config = function()
      require("telescope").setup({})
    end,
  },
}
