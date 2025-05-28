local status, telescope = pcall(require, "telescope")
if not status then
  return
end

telescope.setup({
  extensions = {
    file_browser = {
      hidden = true,  -- show hidden files
    },
  },
})

-- Load extensions after setup
require("telescope").load_extension("file_browser")
