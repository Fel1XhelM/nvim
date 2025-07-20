-- ========================
-- General Neovim Settings
-- ========================

-- Leader keys
vim.g.mapleader        = ' '    -- Space as <leader>
vim.g.maplocalleader   = ' '

local opt = vim.opt

-- Appearance
opt.number             = true   -- Show line numbers
opt.relativenumber     = true   -- Show relative numbers
opt.signcolumn         = 'yes'  -- Always show the sign column
opt.cursorline         = true   -- Highlight the current line
opt.termguicolors      = true   -- Enable 24-bit RGB colors
opt.syntax             = 'enable'  -- Turn on syntax highlighting
opt.showcmd            = true   -- Show (partial) command in statusline

-- Indentation
opt.tabstop            = 4      -- Number of spaces that a <Tab> in the file counts for
opt.shiftwidth         = 4      -- Number of spaces to use for each step of (auto)indent
opt.expandtab          = true   -- Use spaces instead of tabs
opt.smartindent        = true   -- Smart autoindenting for new lines

-- Clipboard
opt.clipboard          = 'unnamedplus'  -- Use system clipboard for all yank/paste

-- Performance / UX
opt.updatetime         = 300    -- Faster CursorHold and completion
opt.mouse              = 'a'    -- Enable mouse in all modes
