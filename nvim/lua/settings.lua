-- ========================
-- General Neovim Settings
-- ========================
local opt = vim.opt

opt.number = true             -- Show line numbers
opt.relativenumber = true     -- Show relative numbers
opt.syntax = "enable"         -- Enable syntax highlighting
opt.tabstop = 4               -- Set tab width to 4 spaces
opt.shiftwidth = 4            -- Auto-indent width 4 spaces
opt.expandtab = true          -- Convert tabs to spaces
opt.smartindent = true        -- Auto-indent new lines
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.termguicolors = true      -- Enable true colors
opt.cursorline = true         -- Highlight the current line
opt.showcmd = true            -- Show command in the status line
