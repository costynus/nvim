vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Path to lazy.nvim.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Install lazy.nvim automatically if it is missing.
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

-- Add lazy.nvim to runtimepath.
vim.opt.rtp:prepend(lazypath)

-- Load plugin specs from lua/plugins.
require("lazy").setup("plugins")

vim.opt.mouse = "a"
vim.opt.encoding = "utf-8"
vim.opt.number = true -- absolute line numbers
vim.opt.swapfile = false -- disable swap files
vim.opt.scrolloff = 7 -- minimum context lines above and below the cursor
vim.opt.relativenumber = true -- relative line numbers
vim.opt.tabstop = 2 -- tab width
vim.opt.softtabstop = 2 -- insert-mode tab width
vim.opt.shiftwidth = 2 -- indent width
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.autoindent = true -- copy indent from the previous line

vim.opt.fileformat = "unix"
-- Enable filetype detection and filetype-specific indent settings.
vim.opt.filetype = "on"
vim.cmd("filetype indent on")

-- Add smart indentation after control structures.
vim.opt.smartindent = true
vim.keymap.set("i", "jk", "<Esc>", { silent = true })

-- Required for icon and theme colors.
vim.opt.termguicolors = true

-- Disable netrw to avoid conflicts with nvim-tree.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.list = true -- show whitespace characters
vim.opt.listchars = {
  space = ".", -- dots instead of spaces
  tab = ">.", -- tab
  trail = ".", -- trailing space
  eol = "¬", -- end-of-line marker
  extends = ">", -- text continues past the right edge
  precedes = "<", -- text continues past the left edge
}

vim.keymap.set("v", "<leader>y", '"+y')

-- Toggle whitespace visibility with <leader>sp.
vim.keymap.set("n", "<leader>sp", function()
  if vim.opt.list:get() then
    vim.opt.list = false
    print("Whitespace display: OFF")
  else
    vim.opt.list = true
    print("Whitespace display: ON")
  end
end, {
  desc = "Toggle whitespace display",
  silent = true,
})

-- Hide whitespace markers while inserting text.
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.opt.list = false
  end,
})

-- Restore whitespace markers after leaving insert mode.
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.opt.list = true
  end,
})

vim.opt.colorcolumn = { "80", "120" }
vim.api.nvim_set_hl(0, "ColorColumn", {
  fg = "none",
  bg = "#2a2a2a",
  blend = 70,
})

vim.opt.showtabline = 6 -- always show when there are more than two tabs
vim.opt.hidden = true -- keep modified buffers open when switching tabs
vim.opt.autowrite = true -- save automatically when switching tabs

vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab", silent = true })
vim.keymap.set("n", "<leader>te", ":tabedit ", { desc = "Open file in tab", silent = true })

vim.keymap.set("n", "gt", ":tabnext<CR>", { desc = "Next tab", silent = true })
vim.keymap.set("n", "gT", ":tabprev<CR>", { desc = "Previous tab", silent = true })
vim.keymap.set("n", "<leader>1", ":1tabnext<CR>", { desc = "Tab 1", silent = true })
vim.keymap.set("n", "<leader>2", ":2tabnext<CR>", { desc = "Tab 2", silent = true })

vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab", silent = true })
vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Close other tabs", silent = true })

vim.keymap.set("n", "<leader>tm<", ":tabmove -1<CR>", { desc = "Move tab left", silent = true })
vim.keymap.set("n", "<leader>tm>", ":tabmove +1<CR>", { desc = "Move tab right", silent = true })
-- vim.opt.tabline = "%t%M"

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left", silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down", silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up", silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right", silent = true })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode", silent = true })
vim.opt.splitright = true -- open new vertical splits on the right

vim.keymap.set("n", "<leader>tb", function()
  local term_exists = false
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == "terminal" then
      term_exists = true
      vim.api.nvim_set_current_win(win)
      break
    end
  end

  if not term_exists then
    vim.cmd("botright 15sp | terminal")
  end
end, { desc = "Open or focus bottom terminal", silent = true })

vim.keymap.set("n", "<leader>nh", function()
  vim.cmd("nohlsearch")
  print("Search highlight cleared")
end, {
  desc = "Clear search highlight",
  silent = true,
})
