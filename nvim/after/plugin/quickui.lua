--------------------------------------------------------------------------------
-- quickui.lua
--------------------------------------------------------------------------------

-- 1. Global QuickUI Settings
vim.g.quickui_menu_position = "tabline"  -- Show menu in the tabline
vim.g.quickui_menu_anchor = "t"
vim.g.quickui_autohide = 0
vim.g.quickui_close_on_action = 0

-- 2. Require LuaSnip (if needed for snippet expansion)
local ls = require("luasnip")
-- Load outosave module
local autosave = require("autosave")
--------------------------------------------------------------------------------
-- 2a. Helper: Expand a snippet by trigger
--------------------------------------------------------------------------------
local function expand_snippet_by_trigger(filetype, trigger)
  local snippets = ls.get_snippets(filetype) or {}
  for _, snip in ipairs(snippets) do
    if snip.trigger == trigger then
      ls.snip_expand(snip)
      return true
    end
  end
  return false
end

--------------------------------------------------------------------------------
-- 2b. Insert snippet via QuickUI
--------------------------------------------------------------------------------
function _G.insert_snippet(snippet_trigger)
  local ft = vim.bo.filetype

  -- Attempt to expand snippet for the current filetype
  local expanded = expand_snippet_by_trigger(ft, snippet_trigger)
  if not expanded then
    -- Fall back to 'all'
    expanded = expand_snippet_by_trigger("all", snippet_trigger)
  end

  if not expanded then
    print(string.format(
      "Snippet '%s' not found in '%s' or 'all'!",
      snippet_trigger,
      ft
    ))
  end
end

--------------------------------------------------------------------------------
-- 3. QuickUI Menus
--------------------------------------------------------------------------------
-- == Macros Menu ==
vim.cmd([[
  autocmd VimEnter * call quickui#menu#install('&Macros', [
        \ ['&Run Macro A\tCtrl+A', 'normal @a', 'Execute macro in register a'],
        \ ['&Run Macro B\tCtrl+B', 'normal @b', 'Execute macro in register b'],
        \ ['&Exit\tCtrl+Q', 'qa', 'Quit Neovim']
        \ ])
]])

-- == Snippets Menu ==
vim.cmd([[
  autocmd VimEnter * call quickui#menu#install('&Snippets', [
        \ ['&Title\tCtrl+T', 'lua insert_snippet("title")', 'Insert HTML Title Block'],
        \ ['&Text Block\tCtrl+X', 'lua insert_snippet("textblock")', 'Insert a Text Block'],
        \ ['&Image\tCtrl+I', 'lua insert_snippet("image")', 'Insert an Image Block']
        \ ])
]])

-- == Tools Menu ==

vim.cmd([[
  autocmd VimEnter * call quickui#menu#install('&Tools', [
        \ ['Toggle &Autosave\tCtrl+S', 'lua require("autosave").toggle_autosave()', 'Enable or Disable Autosave'],
	\ ['&Exit\tCtrl+Q','qa', 'Quit Neovim']
	\ ])
]])
--------------------------------------------------------------------------------
-- 4. Keybindings for Menus (Optional)
--------------------------------------------------------------------------------
-- Press <F2> to open Macros
--vim.api.nvim_set_keymap(
--  'n',
--  '<F2>',
--  ':call quickui#menu#open("Macros")<CR>',
--  { noremap = true, silent = true }
--)

-- Press <F3> to open Snippets
--vim.api.nvim_set_keymap(
--  'n',
--  '<F3>',
--  ':call quickui#menu#open("Snippets")<CR>',
--  { noremap = true, silent = true }
--)

--------------------------------------------------------------------------------
-- 5. (Optional) Open a Menu on Startup
--------------------------------------------------------------------------------
-- vim.cmd("autocmd VimEnter * call quickui#menu#open('Macros')")
