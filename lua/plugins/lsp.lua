return {
  "neovim/nvim-lspconfig",
  config = function()
    -- python
    vim.lsp.config("ruff", {})
    vim.lsp.enable("ruff")
    -- Rust
    vim.lsp.config("rust_analyzer", {
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
          },
          checkOnSave = true,
        },
      },
    })
    vim.lsp.enable("rust_analyzer")
    -- Go
    vim.lsp.config("gopls", {
      settings = {
        gopls = {
          staticcheck = true,
          gofump = true,
        },
      },
    })
    vim.lsp.enable("gopls")
    -- C / C++
    vim.lsp.config("clangd", {
      cmd = { "clangd", "--background-index", "--clang-tidy" },
      init_options = {
        fallbackFlags = { '-std=c++20' },
      },
    })
    vim.lsp.enable("clangd")

    vim.api.nvim_set_hl(0, "NormalFloat", {
      bg = "#1e1e2e",
    })

    vim.api.nvim_set_hl(0, "FloatBorder", {
      fg = "#A0A0A0",
    })
    -- vim.api.nvim_set_hl(0, "FloatBorder", {
    --   fg = "#E5C07B",
    --   bg = "#1e1e2e",
    -- })

    vim.diagnostic.config({
      virtual_text = false,
      signs = true,
      underline = true,
      float = {
        border = "rounded",
        focusable = false,
        style = "minimal",
        source = "if_many",

        header = "",
        prefix = "",
      },
    })

    -- vim.diagnostic.config({
    --   virtual_text = false,
    --   signs = true,
    --   underline = true,
    --   float = {
    --     border = "rounded",
    --     source = "if_many",
    --   },
    -- })
    --
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
  end,
}
