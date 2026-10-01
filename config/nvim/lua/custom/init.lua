-- Enable mouse support
vim.o.mouse = "a"

-- Use system clipboard (copy/paste between Neovim and macOS)
vim.o.clipboard = "unnamedplus"

-- Line numbers
vim.wo.number = true          -- Show line numbers
vim.wo.relativenumber = true  -- Relative numbers (optional, good for motions)

-- Indentation
vim.o.tabstop = 2       -- Tabs = 2 spaces
vim.o.shiftwidth = 2    -- Indent width
vim.o.expandtab = true  -- Use spaces instead of tabs
vim.o.smartindent = true

-- Search
vim.o.ignorecase = true -- Case insensitive search…
vim.o.smartcase = true  -- …unless you type uppercase

-- UI
vim.o.termguicolors = true -- Better colors
vim.o.cursorline = true    -- Highlight current line

-- Splits
vim.o.splitbelow = true -- New splits open below
vim.o.splitright = true -- New vsplits open to the right

-- Save/undo
vim.o.undofile = true   -- Persistent undo
vim.o.updatetime = 300  -- Faster updates for plugins like gitgutter


-- init.lua

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = " " -- Space as leader

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.js",
  callback = function()
    vim.fn.termopen("npm test")
  end
})


-- ----------------------
-- File operations
-- ----------------------
map('n', '<D-s>', ':w<CR>', opts)           -- Cmd+S -> Save
map('n', '<D-q>', ':q<CR>', opts)           -- Cmd+Q -> Quit
map('n', '<D-Shift-Q>', ':qa!<CR>', opts)   -- Cmd+Shift+Q -> Quit all
map('n', '<D-n>', ':enew<CR>', opts)        -- Cmd+N -> New file

-- ----------------------
-- Editing / Code
-- ----------------------
map('n', '<D-d>', 'dd', opts)               -- Cmd+D -> Delete line
map('n', '<D-c>', 'yy', opts)               -- Cmd+C -> Copy line
map('n', '<D-v>', 'p', opts)                -- Cmd+V -> Paste
map('n', '<D-z>', 'u', opts)                -- Cmd+Z -> Undo
map('n', '<D-Shift-Z>', '<C-R>', opts)      -- Cmd+Shift+Z -> Redo

-- ----------------------
-- Navigation
-- ----------------------
map('n', '<D-Left>', 'b', opts)             -- Cmd+Left -> previous word
map('n', '<D-Right>', 'w', opts)            -- Cmd+Right -> next word
map('n', '<D-Up>', 'gg', opts)              -- Cmd+Up -> top of file
map('n', '<D-Down>', 'G', opts)             -- Cmd+Down -> bottom of file
map('n', '<D-]', ':bnext<CR>', opts)        -- Cmd+] -> next buffer
map('n', '<D-[>', ':bprevious<CR>', opts)   -- Cmd+[ -> previous buffer

-- ----------------------
-- Search / Replace
-- ----------------------
map('n', '<D-f>', '/', opts)                -- Cmd+F -> find
map('n', '<D-r>', ':%s/', opts)             -- Cmd+R -> replace

-- ----------------------
-- Windows / Splits
-- ----------------------
map('n', '<D-\\>', ':vsplit<CR>', opts)     -- Cmd+\ -> vertical split
map('n', '<D-_>', ':split<CR>', opts)       -- Cmd+_ -> horizontal split
map('n', '<D-h>', '<C-W>h', opts)           -- Cmd+H -> move left window
map('n', '<D-l>', '<C-W>l', opts)           -- Cmd+L -> move right window
map('n', '<D-k>', '<C-W>k', opts)           -- Cmd+K -> move top window
map('n', '<D-j>', '<C-W>j', opts)           -- Cmd+J -> move bottom window

-- ----------------------
-- Code actions / LSP
-- ----------------------
map('n', '<D-Alt-L>', ':lua vim.lsp.buf.formatting()<CR>', opts) -- Cmd+Option+L -> Reformat
map('n', '<D-Alt-O>', ':lua vim.lsp.buf.code_action()<CR>', opts) -- Cmd+Option+O -> Optimize imports
map('n', '<D-B>', ':lua vim.lsp.buf.definition()<CR>', opts)       -- Cmd+B -> Go to definition
map('n', '<D-Alt-B>', ':lua vim.lsp.buf.references()<CR>', opts)   -- Cmd+Option+B -> Find usages

-- ----------------------
-- Tabs
-- ----------------------
map('n', '<D-Tab>', ':tabnext<CR>', opts)      -- Cmd+Tab -> next tab
map('n', '<D-Shift-Tab>', ':tabprevious<CR>', opts) -- Cmd+Shift+Tab -> previous tab

-- ----------------------
-- Misc
-- ----------------------
map('n', '<D-Space>', ':nohlsearch<CR>', opts) -- Cmd+Space -> clear search highlight


require("custom.null-ls")

