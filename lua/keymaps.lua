-- ========================
-- Key Mappings
-- ========================
local opts = { noremap = true, silent = true }
local platform = require("platform")

vim.keymap.set("n", "<F2>", "<cmd>call quickui#menu#open()<CR>", opts)

local function open_file_browser()
  local ok, telescope = pcall(require, "telescope")
  if not ok then
    vim.notify("telescope.nvim is not available", vim.log.levels.WARN)
    return
  end

  local extension = telescope.extensions.file_browser
  if not extension or not extension.file_browser then
    vim.notify("telescope-file-browser.nvim is not available", vim.log.levels.WARN)
    return
  end

  extension.file_browser({
    path = platform.file_browser_root,
    cwd = platform.file_browser_root,
    hidden = true,
  })
end

local function change_to_home_and_toggle_tree()
  vim.cmd.cd(vim.env.HOME or "~")

  local ok, api = pcall(require, "nvim-tree.api")
  if not ok then
    vim.notify("nvim-tree is not available", vim.log.levels.WARN)
    return
  end

  api.tree.toggle()
end

vim.keymap.set("n", "<F3>", open_file_browser, opts)
vim.keymap.set("n", "<F4>", change_to_home_and_toggle_tree, opts)
