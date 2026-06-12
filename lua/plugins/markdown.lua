return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      heading = {
        enabled = true,
      },
      bullet = {
        enabled = true,
      },
      code = {
        enabled = true,
      },
    },
    config = function(_, opts)
      require("render-markdown").setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          vim.opt_local.list = false
          vim.opt_local.wrap = true
          vim.opt_local.linebreak = true
          vim.opt_local.conceallevel = 2
          vim.opt_local.concealcursor = "nc"

          vim.b.miniindentscope_disable = true
          vim.b.indent_blankline_enabled = false
        end,
      })

      local function set_markdown_highlights()
        vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { bg = "NONE" })

        vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = "#89b4fa", bold = true, bg = "NONE" })
        vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = "#a6e3a1", bold = true, bg = "NONE" })
        vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = "#f9e2af", bold = true, bg = "NONE" })
        vim.api.nvim_set_hl(0, "RenderMarkdownH4", { fg = "#f38ba8", bold = true, bg = "NONE" })
        vim.api.nvim_set_hl(0, "RenderMarkdownH5", { fg = "#cba6f7", bold = true, bg = "NONE" })
        vim.api.nvim_set_hl(0, "RenderMarkdownH6", { fg = "#94e2d5", bold = true, bg = "NONE" })

        vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "#1e1e2e" })
        vim.api.nvim_set_hl(0, "RenderMarkdownBullet", { fg = "#89b4fa" })
      end

      set_markdown_highlights()

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          set_markdown_highlights()
        end,
      })
    end,
  },
}
