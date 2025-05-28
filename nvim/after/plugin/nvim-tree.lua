require("nvim-tree").setup({
  view = {
    width = 30,
    side = "right",
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})
