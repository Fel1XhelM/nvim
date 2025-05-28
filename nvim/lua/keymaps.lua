-- ========================
-- Key Mappings
-- ========================
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<F2>", ":call quickui#menu#open()<CR>", opts) -- Open QuickUI menu
map("n", "<F3>", ":Telescope file_browser path=~/storage/shared hidden=true<CR>", opts) -- Open file browser in Android storage

vim.api.nvim_set_keymap(
  "n",
  "<F4>",
  ":lua ChangeToHomeAndToggleTree()<CR>",
  { noremap = true, silent = true }
)

function ChangeToHomeAndToggleTree()
  vim.cmd("cd ~")
  require("nvim-tree.api").tree.toggle()
end
