-- ===================================================================
-- autosave.lua
-- ===================================================================
-- Simple toggling of an 'autosave_enabled' state with an autocmd group.
-- Now includes TextChangedI so it saves while in insert mode.

local M = {}

local function enable_autosave()
  vim.g.autosave_enabled = true

  vim.cmd([[
    augroup MyAutoSave
      autocmd!
      " Save on insert leave or any text change (including insert mode)
      autocmd InsertLeave,TextChanged,TextChangedI * silent! write
    augroup END
  ]])
  print("Autosave: Enabled (including while in insert mode)")
end

local function disable_autosave()
  vim.g.autosave_enabled = false

  vim.cmd([[
    augroup MyAutoSave
      autocmd!
    augroup END
  ]])
  print("Autosave: Disabled")
end

function M.toggle_autosave()
  if vim.g.autosave_enabled == nil then
    vim.g.autosave_enabled = false
  end

  if vim.g.autosave_enabled then
    disable_autosave()
  else
    enable_autosave()
  end
end

return M
