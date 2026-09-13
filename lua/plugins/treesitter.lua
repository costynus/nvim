return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter").install({
      "go",
      "python",
      "rust",
      "c",
      "cpp",
      "lua",
      "markdown",
      "markdown_inline",
      "json",
      "yaml",
      "toml",
      "bash",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "go",
        "python",
        "rust",
        "c",
        "cpp",
        "lua",
        "markdown",
        "json",
        "yaml",
        "toml",
        "sh",
        "bash",
      },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
